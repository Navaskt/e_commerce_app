import 'dart:convert';

ProductItem productItemFromJson(String str) =>
    ProductItem.fromJson(json.decode(str));

class ProductItem {
  String id;
  String user;
  List<Item> cartItem;
  String createdAt;
  String updatedAt;
  int v;

  ProductItem({
    this.id = "",
    this.user = "",
    this.cartItem = const [],
    this.createdAt = "",
    this.updatedAt = "",
    this.v = 0,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
    id: json["_id"] ?? "",
    user: json["user"] ?? "",
    cartItem: json["items"] == null
        ? []
        : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"],
  );
}

class Item {
  String product;
  int quantity;
  String id;

  Item({this.product = "", this.quantity = 0, this.id = ""});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    product: json["product"] ?? "",
    quantity: json["quantity"] ?? 0,
    id: json["_id"] ?? "",
  );
}
