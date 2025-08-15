import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/registration_page.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

class RegistrationPageRouteBuilder {
  ServiceLocator serviceLocator;
  RegistrationPageRouteBuilder(this.serviceLocator);
  Widget call(BuildContext context) {
    return RegistrationPage(serviceLocator: serviceLocator);
  }
}
