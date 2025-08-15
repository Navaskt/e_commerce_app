import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

class ImageButtonWidget extends StatelessWidget {
  final String imagepath;
  final VoidCallback? onpress;
  final Color? bgcolor;
  final double? buttonwidth;
  final double? verticalPadding;
  const ImageButtonWidget({
    super.key,
    required this.imagepath,
    this.onpress,
    this.bgcolor,
    this.buttonwidth,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      splashColor: transparent,
      highlightColor: transparent,
      onTap: onpress,
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 14.0),
        width: buttonwidth ?? screenSize.width,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
          
        ),
        child: Center(child: Image.asset(imagepath)),
      ),
    );
  }
}
