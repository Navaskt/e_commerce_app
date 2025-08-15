import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/on_boarding_page/on_boarding_page.dart';

import '../../../../../services/service_locator.dart';

class OnBoardingPageRouteBuilder {
  final ServiceLocator serviceLocator;
  OnBoardingPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return OnBoardingPage(serviceLocator);
  }
}
