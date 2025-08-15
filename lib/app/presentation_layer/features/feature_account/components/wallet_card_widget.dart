import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class WalletCardWidget extends StatelessWidget {
  final int balance;
  final int expirationDays;
  final String titlte;
  final String imagePath;

  const WalletCardWidget({
    super.key,
    required this.balance,
    this.expirationDays = -1,
    required this.titlte,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: customColors().backgroundPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: customColors().grey),
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(imagePath, height: 40, width: 40),
                if (expirationDays != -1)
                  Text(
                    'Expires in $expirationDays Days',
                    style: customTextStyle(
                      fontStyle: FontStyle.BodyM_SemiBold,
                      color: FontColor.FontPrimary,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              balance.toString(),
              style: customTextStyle(
                fontStyle: FontStyle.BodyXL_SemiBold,
                color: FontColor.FontPrimary,
              ),
            ),
            Text(
              titlte,
              style: customTextStyle(
                fontStyle: FontStyle.BodyL_SemiBold,
                color: FontColor.FontPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}