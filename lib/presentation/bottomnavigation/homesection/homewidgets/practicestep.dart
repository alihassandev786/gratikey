import 'package:flutter/material.dart';
import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/Backbutton.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/mediaquery.dart';
import 'goldpill.dart';

/// Practice ke steps ka header: back button + "Step X of Y  title" pill + progress bar.
class PracticeStepHeader extends StatelessWidget {
  final int step;
  final int total;
  final String title;
  final VoidCallback? onBack;

  const PracticeStepHeader({
    super.key,
    required this.step,
    required this.total,
    required this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final double btn = AppSize.widthPercent(0.13);

    return Column(
      children: [
        SizedBox(
          height: btn,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Custombackbutton(size: btn, onTap: onBack),
              ),
              GoldPill(
                text: "Step $step of $total  $title",
                fontSize: AppSize.widthPercent(0.03),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSize.widthPercent(0.035)),
        SizedBox(
          width: AppSize.widthPercent(0.26),
          height: AppSize.widthPercent(0.013),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: AppColors.secondary1.withOpacity(0.22)),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (step / total).clamp(0.0, 1.0),
                  child: Container(color: AppColors.secondary1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Practice ke 4 steps ka common page:
/// AppBackground + PracticeStepHeader + scrollable [child] + neeche gradient button.
class PracticeStepPage extends StatelessWidget {
  final int step;
  final int total;
  final String title;
  final Widget child;
  final String buttonText;
  final VoidCallback onButtonTap;
  final VoidCallback? onBack;

  const PracticeStepPage({
    super.key,
    required this.step,
    required this.title,
    required this.child,
    required this.buttonText,
    required this.onButtonTap,
    this.total = 4,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.055)),
        child: Column(
          children: [
            SizedBox(height: AppSize.heightPercent(0.02)),
            PracticeStepHeader(
              step: step,
              total: total,
              title: title,
              onBack: onBack,
            ),
            SizedBox(height: AppSize.widthPercent(0.06)),
            Expanded(
              child: SingleChildScrollView(
                child: child,
              ),
            ),
            SizedBox(height: AppSize.heightPercent(0.015)),
            CustomButton(title: buttonText, onTap: onButtonTap),
            SizedBox(height: AppSize.heightPercent(0.03)),
          ],
        ),
      ),
    );
  }
}
