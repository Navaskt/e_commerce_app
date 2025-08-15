import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/textfield/custom_text_form_field.dart';
import 'package:qliqmobile_jobtest/constant/theme/styles.dart';

import '../../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  // Controllers to manage the text in the input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController =
      TextEditingController();

  // State variable to toggle password visibility

  @override
  void dispose() {
    // Disposing controllers to free up resources
    _emailController.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _verifyPasswordController.dispose();
    super.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarMain(title: "Reset Password"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      fieldName: "Enter Your Email",
                      context: context,
                      controller: _emailController,
                      bottomStartWidget: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Please check your email for the otp",
                          style: customTextStyle(
                            fontStyle: FontStyle.BodyL_SemiBold,
                            color: FontColor.FontPrimary,
                          ),
                        ),
                      ),

                      bottomEndWidget: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Resend OTP",
                          style: customTextStyle(
                            fontStyle: FontStyle.BodyL_SemiBold,
                            color: FontColor.FontPrimary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      context: context,
                      controller: _otpController,
                      fieldName: 'Verify Email',
                      hintText: 'Enter otp',
                      suffixIcon: Icon(
                        color: customColors().pacificBlue,
                        Icons.check_circle,
                      ),
                    ),

                    const SizedBox(height: 24),

                    CustomTextFormField(
                      context: context,
                      controller: _passwordController,
                      fieldName:
                          'Password \nAt least 9 characters, containing a letter and a number',
                      obscureTextStatus: true,
                      obscureIcon: true,
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      context: context,
                      controller: _verifyPasswordController,
                      fieldName: 'Verify Password',
                      hintText: 'Enter your password',
                      suffixIcon: Icon(
                        color: customColors().pacificBlue,
                        Icons.check_circle,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomRoundedButton(
            text: "Reset Password",
            bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
            bordercolor: customColors().backgroundPrimary,
            textStyle: customTextStyle(
              fontStyle: FontStyle.HeaderXS_SemiBold,
              color: FontColor.PacificBlue,
            ),
            onpress: () {},
          ),
        ),
      ),
    );
  }
}
