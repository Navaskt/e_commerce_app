import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/claim_profile_page/claim_profile_page.dart';

import '../../../../../services/service_locator.dart';

class ClaimProfilePageRouteBuilder {
  final ServiceLocator serviceLocator;
  ClaimProfilePageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return ClaimProfilePage(serviceLocator);
  }
}
