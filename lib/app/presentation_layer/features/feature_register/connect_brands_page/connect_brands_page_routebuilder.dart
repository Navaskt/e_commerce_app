import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/connect_brands_page/connect_brands_page.dart';

import '../../../../../services/service_locator.dart';

class ConnectBrandsPageRouteBuilder {
  final ServiceLocator serviceLocator;
  ConnectBrandsPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return ConnectBrandsPage(serviceLocator);
  }
}
