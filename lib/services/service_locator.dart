import 'package:get_it/get_it.dart';
import 'package:qliqmobile_jobtest/services/api_service/service.dart';
import 'package:qliqmobile_jobtest/services/navigation_service/navigation_controller.dart';

final class ServiceLocator {
  final String _baseUrl;

  final GetIt _registry = GetIt.asNewInstance();

  ServiceLocator(String baseUrl) : _baseUrl = baseUrl;

  NavigationController get navigationService =>
      _registry.get<NavigationController>();

  ApiController get apiService => _registry.get<ApiController>();

  void configureServices() {
    _registerNonDebuggableServices();
  }

  void _registerNonDebuggableServices() {
    _registry.registerLazySingleton(() => NavigationController());
    _registry.registerLazySingleton(() => ApiController(_baseUrl));
  }
}
