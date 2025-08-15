import 'package:flutter/material.dart';
import 'package:qliqmobile_jobtest/services/navigation_service/navigation.dart';
import 'package:qliqmobile_jobtest/services/navigation_service/routes_names.dart';

final class NavigationController {
  Future<void> openWelcomePage(BuildContext context) {
    return Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(RouteNames.welcome, (route) => false);
  }

  Future<void> openLoginPage(BuildContext context) {
    return Navigator.of(context).pushNamed(RouteNames.login);
  }

  Future<void> openRegstrationPage(BuildContext context) {
    return Navigator.of(context).pushNamed(RouteNames.registration);
  }

  Future<void> openUserRegistrationPage(BuildContext context) {
    return Navigator.of(context).pushNamed(RouteNames.userRegistration);
  }

  Future<void> openSecondRegisterPage(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    return Navigator.of(
      context,
    ).pushNamed(RouteNames.tfaLoginPage, arguments: MapArguments(data));
  }

  Future<void> openDashboardPage(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    return Navigator.of(
      context,
    ).pushNamed(RouteNames.dashBoardScreen, arguments: MapArguments(data));
  }

  Future<void> openProductDetailPage(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    return Navigator.of(context).pushNamed(
      RouteNames.productDetailPageRouteName,
      arguments: MapArguments(data),
    );
  }

  Future<void> openCartPage(BuildContext context) {
    return Navigator.of(context).pushNamed(RouteNames.cartPageRouteName);
  }

  Future<void> openResetPasswordPage(BuildContext context) {
    return Navigator.of(
      context,
    ).pushNamed(RouteNames.resetPasswordPageRouteName);
  }

  Future<void> openClaimProfilePage(BuildContext context) {
    return Navigator.of(context).pushNamed(RouteNames.claimProfilePageRoute);
  }

  Future<void> openWislistPage(BuildContext context) {
    return Navigator.of(context).pushNamed(RouteNames.wishlistPageRoteName);
  }

  Future<void> openCheckOutPage(BuildContext context) {
    return Navigator.of(context).pushNamed(RouteNames.checkOutPageRouteName);
  }

  dynamic back(BuildContext context, {Map<String, dynamic>? arg}) {
    return Navigator.pop(context, arg);
  }
}
