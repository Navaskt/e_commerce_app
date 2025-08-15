import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_login/login_page/components/image_button_widget.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/button/custom_rounded_button.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/textfield/custom_text_form_field.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../../user_controller/user_controller.dart';
import '../../../../../../utils/utils.dart';

class LoginPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const LoginPage({super.key, required this.serviceLocator});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  late GlobalKey<FormState> passFormKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isLoading = false;

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBarMain(title: "Login"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: emailFormKey,
                            child: CustomTextFormField(
                              textInputAction: TextInputAction.none,
                              context: context,
                              controller: emailCtrl,
                              fieldName: "Email",
                              keyboardType: TextInputType.emailAddress,
                              onChange: (val) {},
                              onFieldSubmit: (value) async {},
                              keyboardAction: () async {},
                            ),
                          ),
                          SizedBox(height: 24),
                          Form(
                            key: passFormKey,
                            child: CustomTextFormField(
                              textInputAction: TextInputAction.none,
                              context: context,
                              controller: passwordCtrl,
                              fieldName: "Password",
                              obscureTextStatus: true,
                              obscureIcon: true,
                              onChange: (val) {},
                              onFieldSubmit: (value) async {},
                              keyboardAction: () async {},
                            ),
                          ),
                          SizedBox(height: 16),
                          InkWell(
                            onTap: () {
                              widget.serviceLocator.navigationService
                                  .openResetPasswordPage(context);
                            },
                            child: Text(
                              "Forget Password ?",
                              style: customTextStyle(
                                fontStyle: FontStyle.BodyL_SemiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: CustomRoundedButton(
                      loading: isLoading,
                      bgcolor: customColors().pacificBlue.withValues(
                        alpha: 0.3,
                      ),
                      onpress: () {
                        setState(() {
                          isLoading = true;
                        });
                        sendLoginRequest(context: context);
                      },
                      bordercolor: customColors().backgroundPrimary,
                      text: "Log in",
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
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Login with",
                style: customTextStyle(
                  color: FontColor.FontPrimary,
                  fontStyle: FontStyle.BodyL_SemiBold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ImageButtonWidget(
                      bgcolor: customColors().backgroundSecondary,
                      onpress: () {},
                      imagepath: "assets/google_icon.png",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ImageButtonWidget(
                      bgcolor: customColors().backgroundSecondary,
                      onpress: () {},
                      imagepath: "assets/facebook_icon.png",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ImageButtonWidget(
                      bgcolor: customColors().backgroundSecondary,
                      onpress: () {},
                      imagepath: "assets/tiktok_icon.png",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ImageButtonWidget(
                      bgcolor: customColors().backgroundSecondary,
                      onpress: () {},
                      imagepath: "assets/instagram_icon.png",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendLoginRequest({required BuildContext context}) async {
    try {
      final loginResponse = await widget.serviceLocator.apiService
          .sendUserLoginRequest(
            emailId: emailCtrl.text,
            password: passwordCtrl.text,
          );
      if (loginResponse.containsKey("token")) {
        UserController().token = loginResponse["token"];
        Map<String, dynamic> data = {"token": loginResponse["token"]};
        widget.serviceLocator.navigationService.openDashboardPage(
          context,
          data,
        );
      } else if (loginResponse.containsKey("message")) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          showErrorDialogue(errorMessage: loginResponse["message"].toString()),
        );
      } else if (loginResponse.containsKey("errors")) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          showErrorDialogue(
            errorMessage: loginResponse["errors"][0]["message"].toString(),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      appLog(e.toString());
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(showErrorDialogue(errorMessage: e.toString()));
    }
  }
}
