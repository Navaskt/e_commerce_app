import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../user_controller/user_controller.dart';
import '../../../../../utils/utils.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../../../../widgets/custom_app_widgets/textfield/custom_text_form_field.dart';

class SecondRegisterPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  final String name;
  final String email;

  const SecondRegisterPage({
    super.key,
    required this.serviceLocator,
    required this.name,
    required this.email,
  });

  @override
  State<SecondRegisterPage> createState() => _SecondRegisterPageState();
}

class _SecondRegisterPageState extends State<SecondRegisterPage> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController verifyPasswordCtrl = TextEditingController();

  TextEditingController verifyEmailController = TextEditingController();

  TextEditingController verifyNumberController = TextEditingController();

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarMain(title: "Create Your", extratitle: "Account"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      textInputAction: TextInputAction.none,
                      context: context,
                      controller: passwordController,
                      fieldName:
                          "Password \nAt least 9 characters, containing a letter and a number",
                      hintText: "Enter your password",
                      keyboardType: TextInputType.visiblePassword,
                      onChange: (val) {},
                      onFieldSubmit: (value) async {},
                      keyboardAction: () async {},
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      textInputAction: TextInputAction.none,
                      context: context,
                      controller: verifyPasswordCtrl,
                      fieldName: "Verify Password",
                      hintText: "Enter yout password",
                      keyboardType: TextInputType.visiblePassword,
                      onChange: (val) {},
                      onFieldSubmit: (value) async {},
                      keyboardAction: () async {},
                    ),
                    SizedBox(height: 20),

                    CustomTextFormField(
                      textInputAction: TextInputAction.none,
                      context: context,
                      controller: verifyEmailController,
                      fieldName: "Verify Email",
                      hintText: "Enter otp",
                      keyboardType: TextInputType.number,
                      onChange: (val) {},
                      onFieldSubmit: (value) async {},
                      keyboardAction: () async {},
                    ),
                    SizedBox(height: 20),

                    CustomTextFormField(
                      textInputAction: TextInputAction.none,
                      context: context,
                      controller: verifyNumberController,
                      fieldName: "Verify phone number",
                      hintText: "Enter otp",
                      keyboardType: TextInputType.number,
                      onChange: (val) {},
                      onFieldSubmit: (value) async {},
                      keyboardAction: () async {},
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
          child: CustomRoundedButton(
            loading: isLoading,
            text: "Register",
            bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
            bordercolor: customColors().backgroundPrimary,
            textStyle: customTextStyle(
              fontStyle: FontStyle.HeaderXS_SemiBold,
              color: FontColor.PacificBlue,
            ),
            onpress: () {
              setState(() {
                isLoading = true;
              });
              sendUserRegistrationRequest(
                context: context,
                password: passwordController.text,
                referalCode: "",
              );
            },
          ),
        ),
      ),
    );
  }

  sendUserRegistrationRequest({
    required BuildContext context,
    required String password,
    required String referalCode,
  }) async {
    try {
      final response = await widget.serviceLocator.apiService
          .sendUserRegisterRequest(
            name: widget.name,
            password: password,
            emaiId: widget.email,
            referalCode: referalCode,
          );
      if (response.containsKey("message") &&
          response["message"] == "User registered successfully") {
        UserController().userID = response["userId"];
        UserController().email = widget.email;
        UserController().password = password;
        sendLoginRequest(password: password, context: context);
      } else if (response.containsKey("errors")) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          showErrorDialogue(
            errorMessage: response["errors"][0]["message"].toString(),
          ),
        );
      }
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

  sendLoginRequest({
    required String password,
    required BuildContext context,
  }) async {
    try {
      final loginResponse = await widget.serviceLocator.apiService
          .sendUserLoginRequest(emailId: widget.email, password: password);
      if (loginResponse.containsKey("token")) {
        UserController().token = loginResponse["token"];
        widget.serviceLocator.navigationService.openClaimProfilePage(context);
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
