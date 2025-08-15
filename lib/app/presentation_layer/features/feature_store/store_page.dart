import 'package:flutter/material.dart';

import '../../../../constant/constant_data.dart';
import '../../../../constant/theme/styles.dart';
import '../../../widgets/custom_app_components/category_list.dart';
import '../../../widgets/custom_app_components/promotion_card.dart';
import '../../../widgets/custom_app_components/section_header.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(
                    'STORE',
                    style: customTextStyle(
                      fontStyle: FontStyle.BodyXL_SemiBold,
                      color: FontColor.FontPrimary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                      textAlign: TextAlign.center,
                      style: customTextStyle(
                        fontStyle: FontStyle.HeaderXS_SemiBold,
                        color: FontColor.FontPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  SectionHeader(
                    title: 'Categories',
                    onSeeAll: () {
                      // TODO: Implement navigation to all categories
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CategoryList(
                      height: 160,
                      width: 160,
                      categories: restaurantProductCategory,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: [
                  SectionHeader(
                    title: 'Order Again',
                    endTitle: "Filters",
                    onSeeAll: () {
                      // TODO: Implement navigation to "Order Again" section
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      height: 222,
                      child: ListView.separated(
                        itemCount: 3,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return PromotionCard(
                            image: 'assets/demo_icon9.png',
                            discount: '-500 on your first order',
                            description:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            onTapItem: () {
                              print("object");
                            },
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
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
}
