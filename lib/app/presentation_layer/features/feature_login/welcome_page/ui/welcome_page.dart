import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/button/custom_rounded_button.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

class WelcomePage extends StatelessWidget {
  final ServiceLocator serviceLocator;
  WelcomePage({super.key, required this.serviceLocator});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: customColors().backgroundPrimary,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 32.0),
            //   child: LinearProgressIndicator(
            //     minHeight: 6.0,
            //     color: customColors().pacificBlue,
            //     backgroundColor: customColors().backgroundSecondary,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                height: 250,
                width: 250,
                child: Image.asset("assets/qliq_icon.png"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 316,
                    height: 116,
                    child: Image.asset("assets/welcome_img.png"),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16.0),
                      child: Text(
                        "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                        textAlign: TextAlign.center,
                        style: customTextStyle(
                          fontStyle: FontStyle.HeaderXS_SemiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomRoundedButton(
                      onpress: () {
                        serviceLocator.navigationService.openRegstrationPage(
                          context,
                        );
                      },
                      bgcolor: customColors().backgroundPrimary,
                      bordercolor: customColors().pacificBlue,
                      text: "Register",
                      textStyle: customTextStyle(
                        color: FontColor.FontPrimary,
                        fontStyle: FontStyle.HeaderXS_SemiBold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: CustomRoundedButton(
                      bgcolor: customColors().pacificBlue.withValues(
                        alpha: 0.3,
                      ),
                      onpress: () {
                        serviceLocator.navigationService.openLoginPage(context);
                      },
                      bordercolor: customColors().backgroundPrimary,
                      text: "Login",
                      textStyle: customTextStyle(
                        color: FontColor.PacificBlue,
                        fontStyle: FontStyle.HeaderXS_SemiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Skip Now",
                style: customTextStyle(
                  fontStyle: FontStyle.BodyL_SemiBold,
                  color: FontColor.FontPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
