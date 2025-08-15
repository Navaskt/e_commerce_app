import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

class UserProfile {
  String id;
  String name;
  String email;
  String password;
  String referralCode;
  dynamic referrer;
  int level;
  List<dynamic> downlines;
  int commissionBalance;
  String createdAt;
  String updatedAt;
  int v;

  UserProfile({
    this.id = "",
    this.name = "",
    this.email = "",
    this.password = "",
    this.referralCode = "",
    this.referrer = "",
    this.level = 0,
    this.downlines = const [],
    this.commissionBalance = 0,
    this.createdAt = "",
    this.updatedAt = "",
    this.v = 0,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    referralCode: json["referralCode"] ?? "",
    referrer: json["referrer"] ?? "",
    level: json["level"] ?? "",
    downlines: json["downlines"] == null
        ? []
        : List<dynamic>.from(json["downlines"]!.map((x) => x)),
    commissionBalance: json["commissionBalance"],
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    v: json["__v"] ?? "",
  );
}
