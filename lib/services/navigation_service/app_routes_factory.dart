part of 'navigation.dart';

class AppRoutesFactory extends RoutesFactory {
  final ServiceLocator _serviceLocator;
  AppRoutesFactory(this._serviceLocator);
  @override
  Route<dynamic> createWelcomePageRoute() {
    return CustomRoute(builder: WelcomePageRouteBuilder(_serviceLocator).call);
  }

  @override
  Route<dynamic> createLoginPageRoute() {
    return CustomRoute(builder: LoginPageRouteBuilder(_serviceLocator).call);
  }

  @override
  Route<dynamic> createRegistationPageRoute() {
    return CustomRoute(
      builder: RegistrationPageRouteBuilder(_serviceLocator).call,
    );
  }

  @override
  Route firstRegistrationPageRoute() {
    return CustomRoute(
      builder: FisrtRegistrationPageRouteBuilder(_serviceLocator).call,
    );
  }

  @override
  Route secondRegisterPageRoute(Map<String, dynamic> data) {
    return CustomRoute(
      builder: SecondRegisterPageRoutebuilder(_serviceLocator, data).call,
    );
  }

  @override
  Route dashboardPageRoute(Map<String, dynamic> data) {
    return CustomRoute(
      builder: DashboardPageRoutebuilder(_serviceLocator, data).call,
    );
  }

  @override
  Route productDetailPageRoute(Map<String, dynamic> data) {
    return CustomRoute(
      builder: ProductDetailPageRoutBuilder(_serviceLocator, data).call,
    );
  }

  @override
  Route cartPageRoute() {
    return CustomRoute(builder: CartPageRouteBuilder(_serviceLocator).call);
  }

  @override
  Route resetPasswordPageRoute() {
    return CustomRoute(
      builder: ResetPasswordPageRouteBuilder(_serviceLocator).call,
    );
  }

  @override
  Route claimProfilePageRoute() {
    return CustomRoute(
      builder: ClaimProfilePageRouteBuilder(_serviceLocator).call,
    );
  }

  @override
  Route wishlistPageRoute() {
    return CustomRoute(builder: WishlistPageRouteBuilder(_serviceLocator).call);
  }

  @override
  Route checkOutPageRoute() {
    return CustomRoute(builder: CheckOutPageRouteBuilder(_serviceLocator).call);
  }
}

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required super.builder});

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
          .animate(
            CurvedAnimation(
              reverseCurve: Curves.easeOut,
              parent: animation,
              curve: Curves.ease,
            ),
          ),
      child: child,
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
