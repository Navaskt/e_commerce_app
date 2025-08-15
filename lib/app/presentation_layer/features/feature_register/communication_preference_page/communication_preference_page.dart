import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/about_you_page/aboute_you_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'package:qliqmobile_jobtest/user_controller/user_controller.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../services/navigation_service/navigation.dart';
import '../../../../../services/permission_service.dart/permission_service.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';

class CommunicationPreferencePage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const CommunicationPreferencePage(this.serviceLocator, {super.key});

  @override
  State<CommunicationPreferencePage> createState() =>
      _CommunicationPreferencePageState();
}

class _CommunicationPreferencePageState
    extends State<CommunicationPreferencePage> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (UserController().locationGranted) {
        final result = await PermissionService.requestNotificationPermission(
          context,
        );
        if (result.isGranted) {
          UserController.userController.notificationGranted = true;
        }
      }
    });
    super.initState();
  }

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
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Column(
                        children: [
                          Text(
                            'Set Your\nCommunication\nPreferences',
                            textAlign: TextAlign.center,
                            style: customTextStyle(
                              fontStyle: FontStyle.HeaderM_SemiBold,
                            ),
                          ),
                          Text(
                            'Switch on notification to ensure you receive 2-step verification requests.',
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
                onpress: () async {
                  Navigator.of(context).push(
                    CustomRoute(
                      builder: (context) =>
                          AbouteYouPage(widget.serviceLocator),
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
                          AbouteYouPage(widget.serviceLocator),
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
