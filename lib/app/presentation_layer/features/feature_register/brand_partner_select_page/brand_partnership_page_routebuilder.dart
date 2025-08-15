import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/brand_partner_select_page/brand_partnership_page.dart';

import '../../../../../services/service_locator.dart';

class BrandPartnershipPageRouteBuild {
  final ServiceLocator serviceLocator;
  BrandPartnershipPageRouteBuild(this.serviceLocator);

  Widget call(BuildContext context) {
    return BrandPartnershipPage(serviceLocator);
  }
}
