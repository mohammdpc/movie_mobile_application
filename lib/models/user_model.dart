class UserModel {
  static String collectionName = "User";
  final String id;
  final String name;
  final String email;
  final String phone;
  final int avatarIndex;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarIndex,
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data["id"],
        name: data["name"],
        email: data["email"],
        phone: data["phone"],
        avatarIndex: data["avatarIndex"],
      );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "avatarIndex": avatarIndex,
    };
  }
}
