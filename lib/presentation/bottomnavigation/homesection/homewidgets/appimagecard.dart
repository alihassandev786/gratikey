import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Rounded image card. Sirf image (labels ke saath) bhi ho sakta hai,
/// ya image ke neeche cream body ([child]) bhi — dono ek hi rounded card mein.
///
/// [overlays]: image ke upar rakhne wale widgets (Positioned / Center / Align).
class AppImageCard extends StatelessWidget {
  final String image;
  final double? imageHeight;
  final List<Widget> overlays;
  final Widget? child;
  final double? radius;
  final Color? bodyColor;
  final EdgeInsetsGeometry? bodyPadding;

  const AppImageCard({
    super.key,
    required this.image,
    this.imageHeight,
    this.overlays = const [],
    this.child,
    this.radius,
    this.bodyColor,
    this.bodyPadding,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius =
    BorderRadius.circular(radius ?? AppSize.widthPercent(0.07));

    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: AppSize.widthPercent(0.04),
            offset: Offset(0, AppSize.widthPercent(0.012)),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: imageHeight ?? AppSize.widthPercent(0.46),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    // Asset na mile to app crash na ho
                    // errorBuilder: (_, __, ___) =>
                    //     Container(color: const Color(0xff2F3B2A)),
                  ),
                  Container(color: Colors.black.withOpacity(0.12)),
                  ...overlays,
                ],
              ),
            ),
            if (child != null)
              Container(
                width: double.infinity,
                color: bodyColor ?? AppColors.secondary3,
                padding: bodyPadding ??
                    EdgeInsets.all(AppSize.widthPercent(0.06)),
                child: child,
              ),
          ],
        ),
      ),
    );
  }
}

/// Image ke upar translucent white label ("Morning Stillness" wagera).
class ImageLabelPill extends StatelessWidget {
  final String text;
  final double? fontSize;

  const ImageLabelPill({super.key, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    final double fs = fontSize ?? AppSize.widthPercent(0.028);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: fs * 1, vertical: fs * 0.5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.28),
        borderRadius: BorderRadius.circular(fs * 3),
      ),
      child: Text(
        text,
        style: TextStyle(fontFamily: "pm", fontSize: fs, color: Colors.white),
      ),
    );
  }
}
