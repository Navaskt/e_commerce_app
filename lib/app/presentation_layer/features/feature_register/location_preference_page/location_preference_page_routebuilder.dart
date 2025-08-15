import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/app/presentation_layer/features/feature_register/location_preference_page/location_preference_page.dart';

import '../../../../../services/service_locator.dart';

class LocationPreferencePageRouteBuilder {
  final ServiceLocator serviceLocator;
  LocationPreferencePageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return LocationPreferencePage(serviceLocator);
  }
}
