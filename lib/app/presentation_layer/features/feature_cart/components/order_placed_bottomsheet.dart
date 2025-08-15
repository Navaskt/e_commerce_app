import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app_page_injectable.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';

class OrderPlacedBottomsheet extends StatelessWidget {
  const OrderPlacedBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 40),
        Image.asset("assets/tick_with_stars.png"),
        const SizedBox(height: 16),
        Text(
          "Order placed successfully",
          textAlign: TextAlign.center,
          style: customTextStyle(
            fontStyle: FontStyle.BodyXL_SemiBold,
            color: FontColor.FontPrimary,
          ),
        ),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: CustomRoundedButton(
                  bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
                  bordercolor: customColors().backgroundPrimary,
                  text: "Done",
                  textStyle: customTextStyle(
                    fontStyle: FontStyle.HeaderXS_SemiBold,
                    color: FontColor.PacificBlue,
                  ),
                  onpress: () {
                    Navigator.pop(context);
                    context.gNavigationService.back(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
