import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/brand_collab_page/brand_collab_page.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/components/niche_card_widget.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import 'package:qliqmobile_jobtest/app/widgets/custom_app_widgets/search_bar/custom_search_bar.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../services/navigation_service/navigation.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';

class BrandPartnershipPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const BrandPartnershipPage(this.serviceLocator, {super.key});

  @override
  State<BrandPartnershipPage> createState() => _BrandPartnershipPageState();
}

class _BrandPartnershipPageState extends State<BrandPartnershipPage> {
  // A list of all available niches
  final List<String> _allNiches = [
    'Category 01',
    'Category 02',
    'Category 03',
    'Category 04',
    'Category 05',
    'Category 06',
    'Category 07',
    'Category 08',
    'Category 09',
    'Category 10',
    'Category 11',
    'Category 12',
    'Category 13',
    'Category 14',
    'Category 15',
  ];

  // A list to hold the currently selected niches
  final List<String> selectedNiches = [];

  void handleNicheSelection(String niche) {
    setState(() {
      if (selectedNiches.contains(niche)) {
        selectedNiches.remove(niche);
      } else if (selectedNiches.length < 10) {
        selectedNiches.add(niche);
      }
    });
  }

  // A list to hold the filtered languages for the search functionality.
  List<String> _filteredNiches = [];

  @override
  void initState() {
    super.initState();
    _filteredNiches = _allNiches;
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
            CustomAppBarMain(title: "Brands", extratitle: "Partnership"),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Text(
                'Choose categories for brands!',
                style: customTextStyle(
                  fontStyle: FontStyle.BodyL_SemiBold,
                  color: FontColor.FontPrimary,
                ),
              ),
            ),
            CustomSearchBar(onChanged: _filterNiches),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio:
                      3, // Adjust this value to control card width/height ratio
                ),
                itemCount: _filteredNiches.length,
                itemBuilder: (context, index) {
                  final niche = _allNiches[index];
                  return NicheCardWidget(
                    text: niche,
                    isSelected: selectedNiches.contains(niche),
                    onTap: () => handleNicheSelection(niche),
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
          child: CustomRoundedButton(
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
                  builder: (context) => BrandCollabPage(widget.serviceLocator),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Function to filter Niches based on search query
  void _filterNiches(String query) {
    final filtered = _allNiches.where((niche) {
      return niche.trim().toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    setState(() {
      _filteredNiches = filtered;
    });
  }
}
