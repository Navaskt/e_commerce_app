import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_discovery/product_detail_page/ui/product_detail_page.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_discovery/product_detail_page/cubit/product_detail_cubit.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

class ProductDetailPageRoutBuilder {
  final ServiceLocator serviceLocator;
  final Map<String, dynamic> data;
  ProductDetailPageRoutBuilder(this.serviceLocator, this.data);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetail(),
      child: ProductDetaiPage(serviceLocator, item: data["productItem"]),
    );
  }
}
