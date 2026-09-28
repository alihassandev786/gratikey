import 'package:flutter/material.dart';
import 'package:gratikey/core/widgets/mediaquery.dart';
import '../../core/widgets/appnavigator.dart';
import '../../core/widgets/background.dart';
import '../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  // Yeh flag track karega ka image precache ho chuki ha ya nahi
  bool _isPrecached = false;

  static const String _logoAsset = 'assets/images/logo.png';

  @override
  void initState() {
    super.initState();

    // Animation Controller setup (1.5 seconds)
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Fade in Animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Scale up Animation
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    // Animation start karein
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Yahan hum logo ko precache kerte hain taake release mode ma
    // image load hone se pehle hi navigation na ho jaye.
    if (!_isPrecached) {
      _isPrecached = true;
      _precacheLogoAndNavigate();
    }
  }

  Future<void> _precacheLogoAndNavigate() async {
    // Dono cheezein parallel chalain: minimum 3 second ka wait
    // aur logo image ka precache. Jo bhi zyada time le, us ka
    // wait kiya jaye ga - is se guarantee milta ha ka logo
    // release build ma bhi sahi show ho ga.
    await Future.wait([
      Future.delayed(const Duration(seconds: 3)),
      precacheImage(const AssetImage(_logoAsset), context),
    ]);

    if (mounted) {
      // Aapke given AppNavigator widget/helper ke zariye navigation
      AppNavigator.replace(
        OnboardingScreen(),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Mediaquery screen size

    return Scaffold(
      body: AppBackground(
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: child,
                ),
              );
            },
            child: Image.asset(
              _logoAsset, // Ensure assets folder me image mapped ho
              width: AppSize.width * 0.75, // Responsive Width
              height: AppSize.height * 0.25, // Responsive Height
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}