import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/second_register_page/second_registration_page.dart';

import '../../../../../services/service_locator.dart';

class SecondRegisterPageRoutebuilder {
  final ServiceLocator serviceLocator;
  Map<String, dynamic> data;
  SecondRegisterPageRoutebuilder(this.serviceLocator, this.data);

  Widget call(BuildContext context) {
    return SecondRegisterPage(
      serviceLocator: serviceLocator,
      email: data["email"],
      name: data["name"],
    );
  }
}
