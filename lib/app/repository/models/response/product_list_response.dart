import 'dart:convert';

List<ProductList> productListFromJson(String str) => List<ProductList>.from(
  json.decode(str).map((x) => ProductList.fromJson(x)),
);

class ProductList {
  String id;
  String name;
  String description;
  double price;
  String image;
  String createdAt;
  String updatedAt;
  int v;
  int cart;

  ProductList({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.cart,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    image: json["image"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    cart: json["cart"],
  );
}
