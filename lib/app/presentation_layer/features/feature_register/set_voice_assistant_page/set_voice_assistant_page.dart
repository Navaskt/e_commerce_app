import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/choose_language_page/language_selection_page.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../services/navigation_service/navigation.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';

class SetVoiceAssistantPage extends StatelessWidget {
  final ServiceLocator serviceLocator;
  const SetVoiceAssistantPage(this.serviceLocator, {super.key});

  @override
  Widget build(BuildContext context) {
    // Getting screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: customColors().backgroundPrimary,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarMain(title: ""),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // The main illustration of the virtual assistant
                    Image.asset(
                      'assets/chat_bot_big_icon.png', // Using a URL for the image
                      height: screenHeight * 0.19, // Responsive image height
                    ),
                    // The main headline text
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          Text(
                            'Set Your Own\nVirtual Voice\nAssistant',
                            style: customTextStyle(
                              fontStyle: FontStyle.HeaderM_SemiBold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // The descriptive subtitle text
                          Text(
                            'Allow microphone access so that I can help you shop by just voice.',
                            style: customTextStyle(
                              fontStyle: FontStyle.BodyL_SemiBold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 120,
          child: Column(
            children: [
              CustomRoundedButton(
                text: "Allow",
                bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
                bordercolor: customColors().backgroundPrimary,
                textStyle: customTextStyle(
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                  color: FontColor.PacificBlue,
                ),
                onpress: () {
                  Navigator.of(context).push(
                    CustomRoute(
                      builder: (context) =>
                          LanguageSelectionPage(serviceLocator),
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              CustomRoundedButton(
                text: "Skip",
                bgcolor: customColors().backgroundPrimary,
                bordercolor: customColors().pacificBlue,
                textStyle: customTextStyle(
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                  color: FontColor.FontPrimary,
                ),
                onpress: () {
                  Navigator.of(context).push(
                    CustomRoute(
                      builder: (context) =>
                          LanguageSelectionPage(serviceLocator),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
