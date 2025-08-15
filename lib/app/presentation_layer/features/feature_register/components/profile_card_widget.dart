import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final bool isSelected;
  final VoidCallback onTap;

  const ProfileCard({
    super.key,
    required this.profile,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
          // Applying a border if the card is selected
          border: Border.all(
            color: isSelected ? customColors().pacificBlue : transparent,
            width: 2,
          ),
          // Adding a subtle shadow for depth
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: customColors().pacificBlue.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular avatar
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/face_avatar.png"),
              onBackgroundImageError: (exception, stackTrace) {
                // Handle image loading errors if any
              },
            ),
            const SizedBox(height: 12),
            // Profile name
            Text(
              profile.name,
              style: customTextStyle(fontStyle: FontStyle.BodyL_SemiBold),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Profile username
            Text(
              profile.username,
              style: customTextStyle(fontStyle: FontStyle.BodyL_SemiBold),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class Profile {
  final String name;
  final String username;
  final String avatarUrl;

  Profile({
    required this.name,
    required this.username,
    required this.avatarUrl,
  });
}
