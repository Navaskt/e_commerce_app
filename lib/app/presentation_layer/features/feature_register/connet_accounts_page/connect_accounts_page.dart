import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/connect_brands_page/connect_brands_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../services/navigation_service/navigation.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../components/account_connect_listitem_widget.dart';

class ConnectAccountsPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const ConnectAccountsPage(this.serviceLocator, {super.key});

  @override
  State<ConnectAccountsPage> createState() => _ConnectAccountsPageState();
}

List<Accounts> accontList = [
  Accounts(name: "Facebook", imagePath: "assets/facebook_icon.png"),
  Accounts(name: "TikTok", imagePath: "assets/tiktok_icon.png"),
  Accounts(name: "Instagram", imagePath: "assets/instagram_icon.png"),
  Accounts(name: "Snapchat", imagePath: "assets/snap_chat_icon.png"),
  Accounts(name: "Linkedin", imagePath: "assets/linkedin_icon.png"),
  Accounts(name: "Youtube", imagePath: "assets/youtube_icon.png"),
];

class _ConnectAccountsPageState extends State<ConnectAccountsPage> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarMain(title: "Connect Your", extratitle: "Accounts"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6),
                child: ListView.separated(
                  itemCount: accontList.length,
                  itemBuilder: (context, index) {
                    return AccountConnectListitemWidget(
                      account: accontList[index],
                      onTap: () {
                        setState(() {
                          // Toggle the selection state of the language
                          accontList[index].isSelected =
                              !accontList[index].isSelected;
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 120,
          child: Column(
            children: [
              CustomRoundedButton(
                text: "Connect",
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
                          ConnectBrandsPage(widget.serviceLocator),
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
                          ConnectBrandsPage(widget.serviceLocator),
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
