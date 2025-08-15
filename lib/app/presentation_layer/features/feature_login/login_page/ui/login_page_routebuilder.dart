import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_login/login_page/cubit/login_cubit.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'login_page.dart';

class LoginPageRouteBuilder {
  final ServiceLocator serviceLocator;
  LoginPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context: context),
      child: LoginPage(serviceLocator: serviceLocator),
    );
  }
}
