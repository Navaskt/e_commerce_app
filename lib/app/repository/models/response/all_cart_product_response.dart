import 'dart:convert';

AllCartProductList cartProductListFromJson(String str) =>
    AllCartProductList.fromJson(json.decode(str));

class AllCartProductList {
  String id;
  String user;
  List<CartItem> cartProductList;
  String createdAt;
  String updatedAt;
  int v;

  AllCartProductList({
    this.id = "",
    this.user = "",
    this.cartProductList = const [],
    this.createdAt = "",
    this.updatedAt = "",
    this.v = 0,
  });

  factory AllCartProductList.fromJson(Map<String, dynamic> json) =>
      AllCartProductList(
        id: json["_id"] ?? "",
        user: json["user"] ?? "",
        cartProductList: json["items"] == null
            ? []
            : List<CartItem>.from(
                json["items"].map((x) => CartItem.fromJson(x)),
              ),
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
        v: json["__v"] ?? 0,
      );
}

class CartItem {
  ProductListItem productItem;
  int quantity;
  String id;

  CartItem({
    required this.productItem,
    required this.quantity,
    required this.id,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    productItem: json["product"] != null
        ? ProductListItem.fromJson(json["product"])
        : ProductListItem(),
    quantity: json["quantity"],
    id: json["_id"],
  );
}

class ProductListItem {
  String id;
  String name;
  double price;
  String image;

  ProductListItem({
    this.id = "",
    this.name = "",
    this.price = 0,
    this.image = "",
  });

  factory ProductListItem.fromJson(Map<String, dynamic> json) =>
      ProductListItem(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        price: json["price"]?.toDouble(),
        image: json["image"] ?? "",
      );
}
