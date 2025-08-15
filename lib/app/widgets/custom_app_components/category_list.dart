import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories;
  final double height;
  final double width;

  const CategoryList({
    super.key,
    required this.categories,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            height: height,
            width: width,
            name: category['name']!,
            image: category['image']!,
          );
        },
      ),
    );
  }
}
