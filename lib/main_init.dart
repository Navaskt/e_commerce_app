import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qliqmobile_jobtest/app/app.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import 'services/service_locator.dart';

Future<void> mainInit() async {
  const String initialRoute = String.fromEnvironment(
    "INITIAL_ROUTE",
    defaultValue: "/welcome",
  );

  runZonedGuarded<void>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final ServiceLocator serviceLocator = ServiceLocator(
        "https://qliq-server-production.up.railway.app",
      )..configureServices();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      runApp(
        Root(
          serviceLocator: serviceLocator,
          app: ECommersApp(
            initialRoute: initialRoute,
            serviceLocator: serviceLocator,
          ),
        ),
      );
    },
    (error, stack) {
      appLog("QLIQ_APP", error: error.toString(), stackTrace: stack);
    },
  );
}
