import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class AccountConnectListitemWidget extends StatelessWidget {
  final Accounts account;
  final VoidCallback onTap;
  const AccountConnectListitemWidget({
    super.key,
    required this.onTap,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
          // Applying a border based on selection state
          border: Border.all(color: customColors().grey, width: 2.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Language name
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(account.imagePath),
                ),
                SizedBox(width: 10,),
                Text(
                  account.name,
                  style: customTextStyle(
                    fontStyle: FontStyle.HeaderXS_SemiBold,
                  ),
                ),
              ],
            ),
            // Selection indicator icon
            Container(
              width:18,
              height: 18,
              decoration: BoxDecoration(
                color: account.isSelected
                    ? customColors().pacificBlue
                    : customColors().backgroundPrimary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: account.isSelected
                      ? customColors().pacificBlue
                      : customColors().grey,
                  width: 2,
                ),
              ),
              child: const Icon(Icons.check, color: white, size: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class Accounts {
  final String name;
  final String imagePath;
  bool isSelected;

  Accounts({
    required this.name,
    this.isSelected = false,
    required this.imagePath,
  });
}
