import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/kyc_verification_page/kyc_verification_page.dart';

import '../../../../../services/service_locator.dart';

class KycVerificationPageRouteBuilder {
  final ServiceLocator serviceLocator;
  KycVerificationPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return KycVerificationPage(serviceLocator);
  }
}
