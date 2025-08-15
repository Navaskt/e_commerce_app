import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/button/custom_rounded_button.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import '../../../../widgets/custom_app_widgets/button/primary_button.dart';
import '../../../../widgets/custom_app_widgets/textfield/custom_text_form_field.dart';
import '../components/gender_select_widget.dart';

class FirstRegistrationPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const FirstRegistrationPage({super.key, required this.serviceLocator});

  @override
  State<FirstRegistrationPage> createState() => _FirstRegistrationPageState();
}

class _FirstRegistrationPageState extends State<FirstRegistrationPage> {
  final TextEditingController nameCntroller = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController contryCodeController = TextEditingController(
    text: "+971",
  );

  final int selectedGender = -1;

  bool _isMaleSelected = true;

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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      context: context,
                      controller: nameCntroller,
                      fieldName: "Your Name",
                      keyboardType: TextInputType.name,
                      onChange: (val) {},
                      onFieldSubmit: (value) async {},
                      keyboardAction: () async {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomTextFormField(
                        bottomEndWidget: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Resent OTP",
                            style: customTextStyle(
                              fontStyle: FontStyle.BodyL_SemiBold,
                              color: FontColor.FontPrimary,
                            ),
                          ),
                        ),
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
                        context: context,
                        controller: emailController,
                        fieldName: "Your Email",
                        keyboardType: TextInputType.emailAddress,
                        onChange: (val) {},
                        onFieldSubmit: (value) async {},
                        keyboardAction: () async {},
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your phone number",
                            style: customTextStyle(
                              fontStyle: FontStyle.HeaderXS_SemiBold,
                              color: FontColor.FontPrimary,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // PhoneNumberField(),
                              SizedBox(
                                width: 55,
                                child: CustomTextFormField(
                                  context: context,
                                  controller: contryCodeController,
                                  fieldName: "",
                                  hintText: "+971",
                                  keyboardType: TextInputType.phone,
                                  onChange: (val) {},
                                  onFieldSubmit: (value) async {},
                                  keyboardAction: () async {},
                                ),
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: CustomTextFormField(
                                  textInputAction: TextInputAction.none,
                                  context: context,
                                  controller: phoneController,
                                  fieldName: "",
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  keyboardType: TextInputType.phone,
                                  onChange: (val) {},
                                  onFieldSubmit: (value) async {},
                                  keyboardAction: () async {},
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Please check your email for the otp",
                                  style: customTextStyle(
                                    fontStyle: FontStyle.BodyL_SemiBold,
                                    color: FontColor.FontPrimary,
                                  ),
                                ),
                                Text(
                                  "Resent OTP",
                                  style: customTextStyle(
                                    fontStyle: FontStyle.BodyL_SemiBold,
                                    color: FontColor.FontPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Select Gender",
                        style: customTextStyle(
                          fontStyle: FontStyle.HeaderXS_SemiBold,
                          color: FontColor.FontPrimary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              verticalPadding: 0,
                              text: 'Delivery',
                              height: 40,
                              onPressed: () {
                                setState(() {
                                  _isMaleSelected = true;
                                });
                              },
                              isFilled: _isMaleSelected,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: PrimaryButton(
                              verticalPadding: 0,
                              height: 40,
                              text: 'Pickup',
                              onPressed: () {
                                setState(() {
                                  _isMaleSelected = false;
                                });
                              },
                              isFilled: !_isMaleSelected,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomRoundedButton(
                              text: "Referral Code",
                              bordercolor: customColors().pacificBlue,
                              textStyle: customTextStyle(
                                fontStyle: FontStyle.HeaderXS_SemiBold,
                                color: FontColor.FontPrimary,
                              ),
                              onpress: () {},
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: CustomRoundedButton(
                              text: "Scan QR Code",
                              bordercolor: customColors().pacificBlue,
                              textStyle: customTextStyle(
                                fontStyle: FontStyle.HeaderXS_SemiBold,
                                color: FontColor.FontPrimary,
                              ),
                              onpress: () {},
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRoundedButton(
                text: "Next",
                bgcolor: customColors().pacificBlue.withValues(alpha: 0.3),
                bordercolor: customColors().backgroundPrimary,
                textStyle: customTextStyle(
                  fontStyle: FontStyle.HeaderXS_SemiBold,
                  color: FontColor.PacificBlue,
                ),
                onpress: () {
                  Map<String, dynamic> data = {
                    "name": nameCntroller.text,
                    "email": emailController.text,
                  };
                  widget.serviceLocator.navigationService
                      .openSecondRegisterPage(context, data);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
