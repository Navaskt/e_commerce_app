import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_account/cubit/account_page_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_account/ui/account_page.dart';

import '../../../../../services/service_locator.dart';

class AccountPageRouteBuilder {
  final ServiceLocator serviceLocator;
  AccountPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountPageCubit(serviceLocator),
      child: AccountPage(serviceLocator),
    );
  }
}
