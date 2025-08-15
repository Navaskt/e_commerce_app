import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/connet_accounts_page/connect_accounts_page.dart';

import '../../../../../services/service_locator.dart';

class ConnetAcountsPageRoueBuilder {
  final ServiceLocator serviceLocator;
  ConnetAcountsPageRoueBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return ConnectAccountsPage(serviceLocator);
  }
}