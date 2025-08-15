part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateAppRoute(
  RoutesFactory routesFactory,
) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.welcome:
        return routesFactory.createWelcomePageRoute();
      case RouteNames.login:
        return routesFactory.createLoginPageRoute();
      case RouteNames.registration:
        return routesFactory.createRegistationPageRoute();
      case RouteNames.userRegistration:
        return routesFactory.firstRegistrationPageRoute();
      case RouteNames.tfaLoginPage:
        final arg = settings.arguments as MapArguments;
        return routesFactory.secondRegisterPageRoute(arg.data);
      case RouteNames.dashBoardScreen:
        final arg = settings.arguments as MapArguments;
        return routesFactory.dashboardPageRoute(arg.data);
      case RouteNames.productDetailPageRouteName:
        final arg = settings.arguments as MapArguments;
        return routesFactory.productDetailPageRoute(arg.data);
      case RouteNames.cartPageRouteName:
        return routesFactory.cartPageRoute();
      case RouteNames.resetPasswordPageRouteName:
        return routesFactory.resetPasswordPageRoute();
      case RouteNames.claimProfilePageRoute:
        return routesFactory.claimProfilePageRoute();
      case RouteNames.wishlistPageRoteName:
        return routesFactory.wishlistPageRoute();
      case RouteNames.checkOutPageRouteName:
        return routesFactory.checkOutPageRoute();
    }
    return null;
  };
}
