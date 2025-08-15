import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/niche_selection_page/niche_selection_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../services/navigation_service/navigation.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';

class OnBoardingPage extends StatelessWidget {
  final ServiceLocator serviceLocator;
  const OnBoardingPage(this.serviceLocator, {super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarMain(title: ""),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: customColors().grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Column(
                        children: [
                          Text(
                            'One Step Away\nFrom Million Dollar\nJourney',
                            textAlign: TextAlign.center,
                            style: customTextStyle(
                              fontStyle: FontStyle.HeaderM_SemiBold,
                            ),
                          ),
                          Text(
                            'Morem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum.',
                            textAlign: TextAlign.center,
                            style: customTextStyle(
                              fontStyle: FontStyle.BodyL_SemiBold,
                            ),
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
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: CustomRoundedButton(
            text: "I Agree",
            bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
            bordercolor: customColors().backgroundPrimary,
            textStyle: customTextStyle(
              fontStyle: FontStyle.HeaderXS_SemiBold,
              color: FontColor.PacificBlue,
            ),
            onpress: () {
              Navigator.of(context).push(
                CustomRoute(
                  builder: (context) => NicheSelectionPage(serviceLocator),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
