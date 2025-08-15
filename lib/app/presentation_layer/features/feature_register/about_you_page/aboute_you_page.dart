import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/connet_accounts_page/connect_accounts_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../services/navigation_service/navigation.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../components/about_you_title_widget.dart';

class AbouteYouPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const AbouteYouPage(this.serviceLocator, {super.key});

  @override
  State<AbouteYouPage> createState() => _AbouteYouPageState();
}

class _AbouteYouPageState extends State<AbouteYouPage> {
  List<Map<String, dynamic>> questions = [
    {
      'text': 'Would you like to make money from social media & brands?',
      'isSelected': false,
    },
    {
      'text':
          'Are you interested in earning money by doing small tasks on social media?',
      'isSelected': false,
    },
    {
      'text': 'Which platforms are you currently active on?',
      'isSelected': false,
    },
    {
      'text':
          'Would you like to connect your social platforms so i can show you how much you can earn from your social media every month?',
      'isSelected': false,
    },
    {
      'text': 'Connect your other platforms to increase your earning potential',
      'isSelected': false,
    },
    {'text': 'Accept all', 'isSelected': false},
  ];

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
            CustomAppBarMain(
              title: "Let’s Know You",
              extratitle: "Little Better",
            ),

            // The list of languages
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return QuestionCard(
                    text: questions[index]['text'],
                    isSelected: questions[index]['isSelected'],
                    onTap: () => handleSelection(
                      index,
                      questions[index]['text'] == "Accept all",
                    ),
                  );
                },
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
                          ConnectAccountsPage(widget.serviceLocator),
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
                          ConnectAccountsPage(widget.serviceLocator),
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

  // State for the "Accept all" checkbox
  bool acceptAllIsSelected = false;

  void handleSelection(int index, bool allselected) {
    // Logic to handle selection. The image shows a single selection for the main questions,
    // so we'll treat them as a radio group.
    setState(() {
      if (allselected) {
        acceptAllIsSelected = !acceptAllIsSelected;
        if (acceptAllIsSelected) {
          // Select all if "Accept all" is checked
          for (var q in questions) {
            q['isSelected'] = true;
          }
        } else {
          // Deselect all if "Accept all" is unchecked
          for (var q in questions) {
            q['isSelected'] = false;
          }
        }
      } else {
        for (int i = 0; i < questions.length; i++) {
          if (i == index) {
            questions[i]['isSelected'] = !questions[i]['isSelected'];
          }
        }
      }
    });
  }
}
