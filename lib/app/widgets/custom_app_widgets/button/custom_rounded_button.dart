import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

class CustomRoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onpress;
  final Color? bgcolor;
  final TextStyle textStyle;
  final Color bordercolor;
  final Color? indicatorColor;
  final double? buttonwidth;
  final bool enabled;
  final double? verticalPadding;
  final bool loading;
  final Color? splashColor;
  final String? keyString;
  final double? height;
  const CustomRoundedButton({
    super.key,
    this.text,
    this.onpress,
    this.bgcolor,
    required this.textStyle,
    this.bordercolor = transparent,
    this.buttonwidth,
    this.enabled = true,
    this.verticalPadding,
    this.loading = false,
    this.indicatorColor,
    this.splashColor,
    this.keyString,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      splashColor: splashColor ?? transparent,
      highlightColor: transparent,
      enableFeedback: enabled,
      onTap: enabled ? onpress : () {},
      child: Container(
        height: height ?? 56,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 14.0),
        width: buttonwidth ?? screenSize.width,
        decoration: BoxDecoration(
          color: enabled ? bgcolor : bgcolor!.withValues(blue: 5.0),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: bordercolor),
        ),
        child: Center(
          child: loading
              ? CupertinoActivityIndicator(
                  animating: true,
                  color: indicatorColor??customColors().fontPrimary,
                )
              : Text(text.toString(), style: textStyle),
        ),
      ),
    );
  }
}
