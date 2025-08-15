import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/navigation_service/navigation_controller.dart';
import 'services/service_locator.dart';

extension AppPageInjectable on BuildContext {
  NavigationController get gNavigationService =>
      read<ServiceLocator>().navigationService;
}
