import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/workspace/cubit/workspace_page_cubit.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/workspace/ui/workspace_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

class DashboardPageRoutebuilder {
  final ServiceLocator serviceLocator;
  final Map<String, dynamic> data;
  DashboardPageRoutebuilder(this.serviceLocator, this.data);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardPageCubit(),
      child: DashboardPage(serviceLocator: serviceLocator),
    );
  }
}
