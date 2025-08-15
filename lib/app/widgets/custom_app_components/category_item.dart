import 'package:flutter/material.dart';

import '../../../constant/theme/styles.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;
  final double height;
  final double width;

  const CategoryItem({
    super.key,
    required this.name,
    required this.image,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: height,
            height: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: customTextStyle(
            fontStyle: FontStyle.HeaderXS_SemiBold,
            color: FontColor.FontPrimary,
          ),
        ),
      ],
    );
  }
}
