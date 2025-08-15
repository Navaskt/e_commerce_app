import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qliqmobile_jobtest/constant/theme/custom_theme.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'package:qliqmobile_jobtest/utils/app_theme.dart';

import '../services/navigation_service/navigation.dart';

class Root extends StatelessWidget {
  const Root({
    // required this.appThemeMode,
    required this.app,
    super.key,
    required this.serviceLocator,
  });

  // final AppThemeMode appThemeMode;
  final ECommersApp app;
  final ServiceLocator serviceLocator;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ServiceLocator>.value(value: serviceLocator),
        ChangeNotifierProvider<CustomTheme>(
          create: (BuildContext context) =>
              CustomTheme(themeMode: CustomMode.light),
        ),
      ],
      child: app,
    );
  }
}

class ECommersApp extends StatelessWidget {
  final String initialRoute;
  final ServiceLocator serviceLocator;
  const ECommersApp({
    super.key,
    required this.initialRoute,
    required this.serviceLocator,
  });

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: CustomTheme.modelTheme == CustomMode.light
            ? ThemeMode.light
            : ThemeMode.dark,
        theme: Provider.of<CustomTheme>(context).currentTheme,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateAppRoute(AppRoutesFactory(serviceLocator)),
      ),
    );
  }
}
