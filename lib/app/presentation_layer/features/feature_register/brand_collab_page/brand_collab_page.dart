import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/components/brand_card_widget.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/final_onboard_page/final_onboard_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

import '../../../../../constant/theme/styles.dart';
import '../../../../../services/navigation_service/navigation.dart';
import '../../../../widgets/custom_app_widgets/appbar/custom_app_bar_main.dart';
import '../../../../widgets/custom_app_widgets/button/custom_rounded_button.dart';
import '../../../../widgets/custom_app_widgets/search_bar/custom_search_bar.dart';

class BrandCollabPage extends StatefulWidget {
  final ServiceLocator serviceLocator;
  const BrandCollabPage(this.serviceLocator, {super.key});

  @override
  State<BrandCollabPage> createState() => _BrandCollabPageState();
}

class _BrandCollabPageState extends State<BrandCollabPage> {
  // Mock data for brands. In a real app, this would come from an API.
  final List<Map<String, dynamic>> allBrands = [
    {
      'name': 'Google',
      'logo': 'assets/google_brand_icon.png',
      'isSelected': false,
    },
    {
      'name': 'Samsung',
      'logo': 'assets/samsung_brand_icon.png',
      'isSelected': false,
    },
    {
      'name': 'Apple',
      'logo': 'assets/apple_brand_icon.png',
      'isSelected': false,
    },
    {'name': 'Sony', 'logo': 'assets/sony_brand_icon.png', 'isSelected': false},
    {
      'name': 'Google2',
      'logo': 'assets/google_brand_icon.png',
      'isSelected': false,
    },
    {
      'name': 'Samsung1',
      'logo': 'assets/samsung_brand_icon.png',
      'isSelected': false,
    },
    {
      'name': 'Samsung2',
      'logo': 'assets/samsung_brand_icon.png',
      'isSelected': false,
    },
    {
      'name': 'Samsung3',
      'logo': 'assets/samsung_brand_icon.png',
      'isSelected': false,
    },
    {
      'name': 'Samsung4',
      'logo': 'assets/samsung_brand_icon.png',
      'isSelected': false,
    },
  ];

  final List<String> selectedBrands = [];

  void handleBrandSelection(String brandName) {
    setState(() {
      if (selectedBrands.contains(brandName)) {
        selectedBrands.remove(brandName);
      } else {
        selectedBrands.add(brandName);
      }
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
            CustomAppBarMain(title: "Brands", extratitle: "Partnership"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
              child: Text(
                'Choose brands you want to collab with!',
                style: customTextStyle(
                  fontStyle: FontStyle.BodyL_SemiBold,
                  color: FontColor.FontPrimary,
                ),
              ),
            ),
            CustomSearchBar(onChanged: (value) {}),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.0, // Square cards
                  ),
                  itemCount: allBrands.length,
                  itemBuilder: (context, index) {
                    final brand = allBrands[index];
                    return BrandCardWidget(
                      brandName: brand['name']!,
                      imageUrl: brand['logo']!,
                      isSelected: selectedBrands.contains(brand['name']),
                      onTap: () => handleBrandSelection(brand['name']),
                    );
                  },
                ),
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
                  builder: (context) => FinalOnboardPage(widget.serviceLocator),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
