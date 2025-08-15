import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class BrandCardWidget extends StatelessWidget {
  final String brandName;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const BrandCardWidget({
    super.key,
    required this.brandName,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: customColors().backgroundSecondary,
          border: Border.all(
            color: customColors().backgroundSecondary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: customColors().grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(imageUrl, height: 50, fit: BoxFit.contain),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: isSelected
                      ? customColors().pacificBlue
                      : customColors().fontPrimary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, size: 12, color: white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
