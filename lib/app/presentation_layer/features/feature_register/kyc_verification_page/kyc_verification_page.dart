import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/on_boarding_page/on_boarding_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../services/navigation_service/navigation.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../../../../widgets/custom_app_widgets/textfield/custom_text_form_field.dart';
import '../components/document_upload_widget.dart';

class KycVerificationPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const KycVerificationPage(this.serviceLocator, {super.key});

  @override
  State<KycVerificationPage> createState() => _KycVerificationPageState();
}

class _KycVerificationPageState extends State<KycVerificationPage> {
  final TextEditingController idController = TextEditingController();
  String? _passportFileName;
  bool enteredNationalID = false;

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
                    CustomAppBarMain(title: "Complete Your", extratitle: "KYC"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DocumentUploadWidget(
                            documentName: "Passport",
                            onTap: () => _pickFile(),
                            fileName: _passportFileName,
                          ),
                          SizedBox(height: 24),
                          CustomTextFormField(
                            textInputAction: TextInputAction.none,
                            context: context,
                            controller: idController,
                            fieldName: "National ID",
                            textCapitalization: TextCapitalization.characters,
                            onChange: (val) {
                              if (val.isNotEmpty) {
                                setState(() {
                                  enteredNationalID = true;
                                });
                              } else {
                                setState(() {
                                  enteredNationalID = false;
                                });
                              }
                            },
                            onFieldSubmit: (value) async {},
                            keyboardAction: () async {},
                            suffixIcon: enteredNationalID
                                ? Icon(
                                    Icons.check_circle,
                                    color: customColors().pacificBlue,
                                    size: 22,
                                  )
                                : null,
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 120,
          child: Column(
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
                  Navigator.of(context).push(
                    CustomRoute(
                      builder: (context) =>
                          OnBoardingPage(widget.serviceLocator),
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
                          OnBoardingPage(widget.serviceLocator),
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

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          _passportFileName = file.name;
        });
        // In a real app, you would now upload this file to a server
        // You can access the file data with `file.path`
      }
    } catch (e) {
      // Handle the error (e.g., show a snackbar)
      appLog('Error picking file: $e');
    }
  }
}
