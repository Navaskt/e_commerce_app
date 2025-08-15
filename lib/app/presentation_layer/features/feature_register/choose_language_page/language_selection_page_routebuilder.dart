import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/choose_language_page/language_selection_page.dart';

import '../../../../../services/service_locator.dart';

class LanguageSelectionPageRouteBuilder {
  final ServiceLocator serviceLocator;
  LanguageSelectionPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return LanguageSelectionPage(serviceLocator);
  }
}
