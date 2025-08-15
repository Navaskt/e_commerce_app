import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qliqmobile_jobtest/constant/theme/custom_theme.dart';
import 'package:qliqmobile_jobtest/services/navigation_service/navigation.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';

class EcommersApp extends StatefulWidget {
  final String initialRoute;
  final ServiceLocator serviceLocator;
  const EcommersApp({
    super.key,
    required this.initialRoute,
    required this.serviceLocator,
  });

  @override
  State<EcommersApp> createState() => _EcommersAppState();
}

class _EcommersAppState extends State<EcommersApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => child!,
      navigatorKey: _navigatorKey,
      initialRoute: widget.initialRoute,
      onGenerateRoute: onGenerateAppRoute(
        AppRoutesFactory(widget.serviceLocator),
      ),

      debugShowCheckedModeBanner: false,
      themeMode: CustomTheme.modelTheme == CustomMode.light
          ? ThemeMode.light
          : ThemeMode.dark,
      theme: Provider.of<CustomTheme>(context).currentTheme,
    );
  }
}
