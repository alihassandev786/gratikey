import 'package:flutter/material.dart';

import '../../../../core/constants/appcolor.dart';
import '../../../../core/widgets/mediaquery.dart';

/// Bara quote text: upar-left opening quote, neeche-right closing quote.
/// [header]: opening quote ke saath right side par (misal "Prompt of the Day").
class QuoteText extends StatelessWidget {
  final String text;
  final Widget? header;
  final double? fontSize;

  const QuoteText({
    super.key,
    required this.text,
    this.header,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle quoteMark = TextStyle(
      fontFamily: "pb",
      fontSize: AppSize.widthPercent(0.1),
      height: 0.9,
      color: AppColors.textcolor1,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\u201C', style: quoteMark),
            const Spacer(),
            if (header != null) header!,
          ],
        ),
        SizedBox(height: AppSize.widthPercent(0.02)),
        Text(
          text,
          style: TextStyle(
            fontFamily: "pm",
            fontSize: fontSize ?? AppSize.widthPercent(0.068),
            height: 1.17,
            color: AppColors.textcolor1,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: AppSize.widthPercent(0.03)),
            child: Text('\u201D', style: quoteMark),
          ),
        ),
      ],
    );
  }
}
