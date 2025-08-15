import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/location_preference_page/location_preference_page.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import 'package:qliqmobile_jobtest/services/navigation_service/navigation.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../../../../widgets/custom_app_widgets/search_bar/custom_search_bar.dart';
import '../components/language_title_widget.dart';

class LanguageSelectionPage extends StatefulWidget {
final  ServiceLocator serviceLocator;
  const LanguageSelectionPage(this.serviceLocator,{super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  // A list to hold the language data. In a real app, this might come from an API.
  final List<Language> _languages = [
    Language(name: 'English', isSelected: true),
    Language(name: 'Hindi'),
    Language(name: 'Arabic'),
    Language(name: 'Bengali'),
    Language(name: 'Urdu'),
    Language(name: 'Tagalog'),
    Language(name: 'Spanish'),
    Language(name: 'French'),
    Language(name: 'German'),
  ];

  // A list to hold the filtered languages for the search functionality.
  List<Language> _filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    _filteredLanguages = _languages;
  }

  // Function to filter languages based on search query
  void _filterLanguages(String query) {
    final filtered = _languages.where((language) {
      return language.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      _filteredLanguages = filtered;
    });
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarMain(title: "Choose Your", extratitle: "Languages"),
            CustomSearchBar(onChanged: _filterLanguages),
            // The list of languages
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: _filteredLanguages.length,
                  itemBuilder: (context, index) {
                    final language = _filteredLanguages[index];
                    return LanguageTile(
                      language: language,
                      onTap: () {
                        setState(() {
                          // Toggle the selection state of the language
                          language.isSelected = !language.isSelected;
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
                      builder: (context) => LocationPreferencePage(widget.serviceLocator),
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
                      builder: (context) => LocationPreferencePage(widget.serviceLocator),
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
