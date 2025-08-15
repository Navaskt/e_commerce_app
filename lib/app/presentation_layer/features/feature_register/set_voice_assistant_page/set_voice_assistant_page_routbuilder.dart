import 'package:flutter/material.dart';

import '../../../../../services/service_locator.dart';
import 'set_voice_assistant_page.dart';

class SetVoivoiceAssistantPageRouteBuilder {
  final ServiceLocator serviceLocator;
  SetVoivoiceAssistantPageRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context) {
    return SetVoiceAssistantPage(serviceLocator);
  }
}