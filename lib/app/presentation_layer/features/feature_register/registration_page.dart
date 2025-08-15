import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

class RegistrationPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const RegistrationPage({super.key, required this.serviceLocator});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  List<String> regModes = [
    "Register as Influencer",
    "Register as Brand",
    "Register as Seller",
    "Register as User",
    "Register as Mall Partner",
    "Register as Agency",
  ];

  int selectedIndex = -1;

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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                CustomAppBarMain(title: ""),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("assets/welcome_img.png")],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: regModes.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      widget.serviceLocator.navigationService
                          .openUserRegistrationPage(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: AnimatedContainer(
                        onEnd: () {
                          setState(() {
                            isSelected = false;
                            selectedIndex = -1;
                          });
                        },
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: isSelected
                                ? customColors().backgroundPrimary
                                : customColors().pacificBlue,
                          ),

                          color: isSelected
                              ? customColors().pacificBlue.withValues(
                                  alpha: 0.3,
                                )
                              : customColors().backgroundPrimary,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 2,
                        ),
                        child: Center(
                          child: Text(
                            regModes[index],
                            textAlign: TextAlign.center,
                            style: customTextStyle(
                              color: isSelected
                                  ? FontColor.PacificBlue
                                  : FontColor.FontPrimary,
                              fontStyle: FontStyle.HeaderXS_SemiBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
