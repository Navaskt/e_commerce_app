import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class NicheCardWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const NicheCardWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: customColors().backgroundPrimary,
          border: Border.all(
            color: isSelected
                ? customColors().pacificBlue
                : customColors().grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: customTextStyle(
                fontStyle: FontStyle.HeaderXS_SemiBold,
                color: FontColor.FontPrimary,
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? customColors().pacificBlue
                      : customColors().grey,
                  width: 2,
                ),
                color: isSelected ? customColors().pacificBlue : transparent,
              ),
              child: Icon(
                Icons.check,
                size: 14,
                color: customColors().fontSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
