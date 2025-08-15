import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class CheckOutButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String amount;
  const CheckOutButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: customColors().pacificBlue.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: customColors().backgroundPrimary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: customTextStyle(
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                  color: FontColor.PacificBlue,
                ),
              ),
              Text(
                "AED $amount",
                style: customTextStyle(
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                  color: FontColor.PacificBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
