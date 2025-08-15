import 'package:flutter/material.dart';

import '../../../constant/theme/styles.dart';

class PromotionCard extends StatelessWidget {
  final String image;
  final String discount;
  final String description;
  final void Function()? onTapItem;

  const PromotionCard({
    super.key,
    required this.image,
    required this.discount,
    required this.description,
    this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Container(
        width: 322,
        decoration: BoxDecoration(
          color: customColors().backgroundPrimary,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: customColors().pacificBlue,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  discount,
                  style: customTextStyle(
                    fontStyle: FontStyle.BodyM_SemiBold,
                    color: FontColor.FontSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
