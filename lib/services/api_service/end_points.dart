class EndPoints {
  static const String userRegister = "/api/auth/user/register";
  static const String userLogin = "/api/auth/user/login";
  static const String getUser = "/api/users/me";
  static const String adminRegister = "/api/auth/admin/register";
  static const String admimLogin = "/api/auth/admin/login";
  static const String viewDashBoard = "/api/admin/dashboard/stats";
  static const String mlmTreeUser = "/api/users/mlm-tree-user";
  static const String mlmTree = "/api/users/mlm-tree";
  static const String getProducts = "/api/products/";
  static const String getProductList = "/api/products/products-list";
  static const String addToCart = "/api/cart/add";
  static const String getCart = "/api/cart";
  static const String removeFromCart = "/api/cart/remove/";
  static const String productCheckout = "/api/checkout";
  static const String paymet = "/api/payment/mock";
}

class ContentTypes {
  static const String applicationCharset = "application/json;charset=UTF-8";
  static const String applicationJson = "application/json";
  static const String formurlencoded = "application/x-www-form-urlencoded";
}
