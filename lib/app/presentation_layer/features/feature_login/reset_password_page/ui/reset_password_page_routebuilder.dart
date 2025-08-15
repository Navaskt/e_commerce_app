import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_login/reset_password_page/cubit/reset_password_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_login/reset_password_page/ui/reset_password_page.dart';

import '../../../../../../services/service_locator.dart';

class ResetPasswordPageRouteBuilder {
  final ServiceLocator serviceLocator;
  ResetPasswordPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: ResetPasswordPage(),
    );
  }
}
