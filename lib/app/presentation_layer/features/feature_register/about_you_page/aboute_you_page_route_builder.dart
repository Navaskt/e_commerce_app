import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/about_you_page/aboute_you_page.dart';

import '../../../../../services/service_locator.dart';

class AboutTouPageRouteBuilder {
  final ServiceLocator serviceLocator;
  AboutTouPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return AbouteYouPage(serviceLocator);
  }
}
