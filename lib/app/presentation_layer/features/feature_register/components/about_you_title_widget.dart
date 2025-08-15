import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

class QuestionCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const QuestionCard({
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
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: customColors().backgroundPrimary,
          border: Border.all(
            color: isSelected
                ? customColors().pacificBlue
                : customColors().grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Custom selection icon
            Container(
              width: 18,
              height: 18,
              margin: const EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? customColors().pacificBlue
                      : customColors().grey,
                  width: 2,
                ),
                color: isSelected
                    ? customColors().pacificBlue
                    : customColors().backgroundPrimary,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 14, color: white)
                  : null,
            ),
            Expanded(
              child: Text(
                text,
                style: customTextStyle(fontStyle: FontStyle.HeaderXS_SemiBold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
