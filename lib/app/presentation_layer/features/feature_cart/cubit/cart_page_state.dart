part of 'cart_page_cubit.dart';

@immutable
sealed class CartPageState {}

final class CartPageInitial extends CartPageState {
  final List<CartItem> allCartData;
  final String errorMsg;
  final int qty;
  CartPageInitial({
    required this.allCartData,
    this.qty = 1,
    this.errorMsg = "",
  });
}

final class CartPageLoading extends CartPageState {}

// final class CartPageError extends CartPageState {
//   String errorMsg;
//   CartPageError({this.errorMsg = ""});
// }
