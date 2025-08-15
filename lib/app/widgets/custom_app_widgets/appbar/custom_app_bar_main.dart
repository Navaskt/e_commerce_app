import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

class CustomAppBarMain extends StatelessWidget {
  final String title;
  final String extratitle;
  // final void Function() onBackPressed;
  final Widget? endWidget;
  const CustomAppBarMain({
    super.key,
    this.extratitle = "",
    required this.title,
    // required this.onBackPressed,
    this.endWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate back to the previous screen if possible
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: customColors().pacificBlue.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: customColors().pacificBlue,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: customTextStyle(
                        fontStyle: FontStyle.HeaderM_SemiBold,
                        color: FontColor.FontPrimary,
                      ),
                    ),
                  ],
                ),
                if (extratitle != "")
                  Row(
                    children: [
                      Text(
                        extratitle,
                        style: customTextStyle(
                          fontStyle: FontStyle.HeaderM_SemiBold,
                          color: FontColor.FontPrimary,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
