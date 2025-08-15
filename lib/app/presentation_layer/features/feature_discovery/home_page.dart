import 'package:flutter/material.dart';

import '../../../../constant/constant_data.dart';
import '../../../widgets/custom_app_components/category_list.dart';
import '../../../widgets/custom_app_components/promotion_card.dart';
import '../../../widgets/custom_app_components/section_header.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CategoryList(
                height: 120,
                width: 80,
                categories: discoveryProductCatogories,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 200,
                width: 364,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (context, index) => SizedBox(width: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/demo_icon1.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SectionHeader(title: 'Our Bestsellers', onSeeAll: () {}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context, index) => SizedBox(),
                  itemBuilder: (context, index) {
                    return PromotionCard(
                      image: 'assets/demo_icon8.png',
                      discount: '-500 on your first order',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
