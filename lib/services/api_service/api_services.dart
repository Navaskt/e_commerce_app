part of 'service.dart';

abstract interface class ApiServices {
  Future<Map<String, dynamic>> sendUserRegisterRequest({
    required String name,
    required String password,
    required String emaiId,
    required String referalCode,
  });
  Future<Map<String, dynamic>> sendUserLoginRequest({
    required String emailId,
    required String password,
  });

  Future<List<ProductList>> sentProductListRequest();

  Future<ProductItem> sendAddtoCartRequest({
    required String productID,
    required int qty,
  });

  Future<AllCartProductList> sendAllCartDataRequest();
  Future<AllCartProductList> deleteCartItemRequest({required String productID});
  Future<UserProfile> sendUserProfileRequest();

}
