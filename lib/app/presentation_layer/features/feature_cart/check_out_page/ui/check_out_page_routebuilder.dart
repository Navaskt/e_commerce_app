import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_cart/check_out_page/cubit/check_out_page_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_cart/check_out_page/ui/check_out_page.dart';

import '../../../../../../services/service_locator.dart';

class CheckOutPageRouteBuilder {
  final ServiceLocator serviceLocator;
  CheckOutPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutPageCubit(serviceLocator),
      child: CheckOutPage(),
    );
  }
}
