import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_login/login_page/cubit/login_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/first_register_page/first_register_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

class FisrtRegistrationPageRouteBuilder {
  final ServiceLocator serviceLocator;
  FisrtRegistrationPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context: context),
      child: FirstRegistrationPage(serviceLocator: serviceLocator),
    );
  }
}
