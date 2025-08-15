part of 'discovery_screen_cubit.dart';

@immutable
sealed class DiscoveryScreenState {}

final class DiscoveryScreenInitial extends DiscoveryScreenState {
  final List<ProductList> productList;
  DiscoveryScreenInitial({required this.productList});
}

final class DiscoveryScreenLoading extends DiscoveryScreenState {}

final class DiscoveryScreenError extends DiscoveryScreenState {
  final String errorMsg;
  DiscoveryScreenError({this.errorMsg = ""});
}
