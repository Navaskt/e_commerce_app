import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/communication_preference_page/communication_preference_page.dart';

import '../../../../../services/service_locator.dart';

class CommunicationPreferencePageRouteBuilder {
  final ServiceLocator serviceLocator;
  CommunicationPreferencePageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return CommunicationPreferencePage(serviceLocator);
  }
}
