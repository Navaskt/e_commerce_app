import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_wishlist/cubit/wishlist_page_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_wishlist/ui/wishlist_page.dart';

import '../../../../../services/service_locator.dart';

class WishlistPageRouteBuilder {
  final ServiceLocator serviceLocator;
  WishlistPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistPageCubit(serviceLocator),
      child: WishlistPage(),
    );
  }
}