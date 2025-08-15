import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class SocialStatsSection extends StatelessWidget {
  final List<String> imageUrls;
  const SocialStatsSection({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: customColors().grey),
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      color: customColors().backgroundPrimary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Social Stats',
              style: customTextStyle(
                fontStyle: FontStyle.HeaderXS_SemiBold,
                color: FontColor.FontPrimary,
              ),
            ),
            Row(
              children: List.generate(imageUrls.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(imageUrls[index], height: 24, width: 24),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
