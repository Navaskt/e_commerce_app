import 'package:flutter/material.dart';

import '../../../constant/theme/styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? endTitle;
  final VoidCallback? onSeeAll;
  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
    this.endTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: customTextStyle(
            fontStyle: FontStyle.BodyXL_SemiBold,
            color: FontColor.FontPrimary,
          ),
        ),
        GestureDetector(
          onTap: () => onSeeAll,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
            decoration: BoxDecoration(
              color: customColors().pacificBlue.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              endTitle ?? 'See All',
              style: customTextStyle(
                fontStyle: FontStyle.BodyL_SemiBold,
                color: FontColor.PacificBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
