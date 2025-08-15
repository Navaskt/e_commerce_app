import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/niche_selection_page/niche_selection_page.dart';

import '../../../../../services/service_locator.dart';

class NicheSelevtionPageRouteBuilder {
  final ServiceLocator serviceLocator;
  NicheSelevtionPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return NicheSelectionPage(serviceLocator);
  }
}
