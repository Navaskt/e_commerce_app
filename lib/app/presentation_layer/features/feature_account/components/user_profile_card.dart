// Reusable widget for the user profile section.
import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class UserProfileCard extends StatelessWidget {
  final String name;
  final String userType;
  final String imageUrl;

  const UserProfileCard({
    super.key,
    required this.name,
    required this.userType,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: customColors().fontPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            CircleAvatar(radius: 30, child: Image.asset(imageUrl)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: customTextStyle(
                    fontStyle: FontStyle.BodyXL_SemiBold,
                    color: FontColor.FontSecondary,
                  ),
                ),
                Text(
                  userType,
                  style: customTextStyle(
                    fontStyle: FontStyle.BodyL_SemiBold,
                    color: FontColor.FontSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
