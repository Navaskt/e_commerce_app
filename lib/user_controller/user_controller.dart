import 'package:qliqmobile_jobtest/app/repository/models/response/all_cart_product_response.dart';

import '../app/repository/models/response/product_list_response.dart';

class UserController {
  UserController._privateConstructor();
  static final UserController userController =
      UserController._privateConstructor();

  factory UserController() {
    return userController;
  }
  String userID = "";
  String email = "";
  String token = "";
  String password = "";

  bool locationGranted = false;
  bool notificationGranted = false;
  //DASHBOARD
  List<ProductList> productList = [];
  List<CartItem> allCartList = [];
  dispose() {
    userID = "";
    password = "";
    token = "";
    email = "";
    productList.clear();
  }
}
