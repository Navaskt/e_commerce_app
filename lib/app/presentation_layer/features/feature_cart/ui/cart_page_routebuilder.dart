import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_cart/cubit/cart_page_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_cart/ui/cart_page.dart';

import '../../../../../services/service_locator.dart';

class CartPageRouteBuilder {
  final ServiceLocator serviceLocator;
  CartPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => CartPageCubit(serviceLocator),
      child: CartPage(serviceLocator: serviceLocator),
    );
  }
}
