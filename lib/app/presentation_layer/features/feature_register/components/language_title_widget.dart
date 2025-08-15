import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

class LanguageTile extends StatelessWidget {
  final Language language;
  final VoidCallback onTap;

  const LanguageTile({super.key, required this.language, required this.onTap});

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
          border: Border.all(color: customColors().pacificBlue, width: 2.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Language name
            Text(
              language.name,
              style: customTextStyle(fontStyle: FontStyle.HeaderXS_SemiBold),
            ),
            // Selection indicator icon
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: language.isSelected
                    ? customColors().pacificBlue
                    : customColors().fontPrimary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: language.isSelected
                      ? customColors().pacificBlue
                      : customColors().fontPrimary,
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

class Language {
  final String name;
  bool isSelected;

  Language({required this.name, this.isSelected = false});
}
