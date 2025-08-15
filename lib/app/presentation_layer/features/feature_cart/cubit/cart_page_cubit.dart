import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:qliqmobile_jobtest/services/service_locator.dart';
import 'package:qliqmobile_jobtest/user_controller/user_controller.dart';
import 'package:qliqmobile_jobtest/utils/utils.dart';

import '../../../../repository/models/response/all_cart_product_response.dart';

part 'cart_page_state.dart';

class CartPageCubit extends Cubit<CartPageState> {
  final ServiceLocator serviceLocator;
  List<CartItem> allCarttList = [];
  CartPageCubit(this.serviceLocator) : super(CartPageLoading()) {
    getCartAllCartProducts();
  }
  getCartAllCartProducts() async {
    try {
      emit(CartPageLoading());
      final allCartData = await serviceLocator.apiService
          .sendAllCartDataRequest();
      for (int i = 0; i < allCartData.cartProductList.length; i++) {
        allCarttList.add(allCartData.cartProductList[i]);
      }
      UserController().allCartList = allCarttList;
      emit(CartPageInitial(allCartData: allCarttList));
    } catch (e) {
      appLog(e.toString());
      emit(CartPageInitial(allCartData: allCarttList, errorMsg: e.toString()));
    }
  }

  onDecrementQty(int qty, int index) {
    if (qty > 1) {
      qty--;
      allCarttList[index].quantity = qty;
      emit(CartPageInitial(allCartData: allCarttList, qty: qty));
    }
  }

  onIncrement(int qty, int index) {
    qty++;
    allCarttList[index].quantity = qty;
    emit(CartPageInitial(allCartData: allCarttList, qty: qty));
  }

  removeProductFromCart(String productid) async {
    try {
      emit(CartPageLoading());
      final allCartData = await serviceLocator.apiService.deleteCartItemRequest(
        productID: productid,
      );

      allCarttList.clear();
      UserController().allCartList.clear();
      for (int i = 0; i < allCartData.cartProductList.length; i++) {
        allCarttList.add(allCartData.cartProductList[i]);
      }
      emit(CartPageInitial(allCartData: allCarttList));
    } catch (e) {
      appLog(e.toString());
      emit(CartPageInitial(allCartData: allCarttList, errorMsg: e.toString()));
    }
  }

  Future<bool> sendAddProductToCartReq(String productID, int qty) async {
    try {
      final result = await serviceLocator.apiService.sendAddtoCartRequest(
        productID: productID,
        qty: qty,
      );
      if (result.cartItem.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
