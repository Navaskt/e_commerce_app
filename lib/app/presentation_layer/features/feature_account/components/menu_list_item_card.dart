import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class MenuListItem extends StatelessWidget {
  final bool showStartIcon;
  final String? startIcon;
  final bool showEndIcon;
  final String title;
  final void Function()? onTap;

  const MenuListItem({
    super.key,
    required this.title,
    this.onTap,
    this.showStartIcon = false,
    this.showEndIcon = true,
    this.startIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: customColors().backgroundPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: customColors().grey),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (showStartIcon) Image.asset(startIcon!),
                  SizedBox(width: 6),
                  Text(
                    title,
                    style: customTextStyle(
                      fontStyle: FontStyle.HeaderXS_SemiBold,
                      color: FontColor.FontPrimary,
                    ),
                  ),
                ],
              ),

              if (showEndIcon)
                Icon(Icons.chevron_right, color: customColors().fontPrimary),
            ],
          ),
        ),
      ),
    );
  }
}
