import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_login/welcome_page/cubit/welcome_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_login/welcome_page/ui/welcome_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

class WelcomePageRouteBuilder {
  ServiceLocator serviceLocator;
  WelcomePageRouteBuilder(this.serviceLocator);
  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(),
      child: WelcomePage(serviceLocator: serviceLocator,),
    );
  }
}
