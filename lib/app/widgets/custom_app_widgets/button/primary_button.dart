import 'package:flutter/material.dart';

import '../../../../constant/theme/styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFilled;
  final double? height;
  final double? width;
  final double? verticalPadding;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFilled = true,
    this.height,
    this.verticalPadding,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: transparent,
      highlightColor: transparent,
      onTap: onPressed,
      child: Container(
        height: height ?? 40,
        width: width ?? size.width,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 14.0),
        decoration: BoxDecoration(
          color: isFilled
              ? customColors().pacificBlue
              : customColors().backgroundPrimary,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: customColors().pacificBlue),
        ),
        child: Center(
          child: Text(
            text.toString(),
            style: customTextStyle(
              fontStyle: FontStyle.HeaderXS_SemiBold,
              color: isFilled ? FontColor.White : FontColor.FontPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
