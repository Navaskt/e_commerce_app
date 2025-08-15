import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/final_onboard_page/final_onboard_page.dart';

import '../../../../../services/service_locator.dart';

class FinalOnboardPageRouteBuilder {
  final ServiceLocator serviceLocator;
  FinalOnboardPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return FinalOnboardPage(serviceLocator);
  }
}
