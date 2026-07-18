class UserModel {
  static String collectionName = "User";
  final String id;
  final String name;
  final String email;
  final String phone;
  final int avatarIndex;
  List<String> wishList;
  List<String> history;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarIndex,
    required this.wishList,
    required this.history,
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data["id"] ?? "",
        name: data["name"] ?? "",
        email: data["email"] ?? "",
        phone: data["phone"] ?? "",
        avatarIndex: data["avatarIndex"] ?? 0,
        wishList: List<String>.from(data["wishList"] ?? []),
        history: List<String>.from(data["history"] ?? []),
      );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "avatarIndex": avatarIndex,
      "wishList": wishList,
      "history": history,
    };
  }
}
