part of 'navigation.dart';

abstract class RoutesFactory {
  Route<dynamic> createWelcomePageRoute();
  Route<dynamic> createLoginPageRoute();
  Route<dynamic> createRegistationPageRoute();
  Route<dynamic> firstRegistrationPageRoute();
  Route<dynamic> secondRegisterPageRoute(Map<String, dynamic> data);
  Route<dynamic> dashboardPageRoute(Map<String,dynamic> data); 
  Route<dynamic> productDetailPageRoute(Map<String,dynamic> data); 
  Route<dynamic> cartPageRoute();
  Route<dynamic> resetPasswordPageRoute();
  Route<dynamic> claimProfilePageRoute();
  Route<dynamic> wishlistPageRoute();
  Route<dynamic> checkOutPageRoute();
  
}
