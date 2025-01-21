import 'dart:convert';

class ChatModel {
  String image;
  String about;
  String name;
  String createdAt;
  String id;
  String lastActive;
  bool isOnline;
  String pushToken;
  String email;

  ChatModel({
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.id,
    required this.lastActive,
    required this.isOnline,
    required this.pushToken,
    required this.email,
  });

  ChatModel copyWith({
    String? image,
    String? about,
    String? name,
    String? createdAt,
    String? id,
    String? lastActive,
    bool? isOnline,
    String? pushToken,
    String? email,
  }) =>
      ChatModel(
        image: image ?? this.image,
        about: about ?? this.about,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        lastActive: lastActive ?? this.lastActive,
        isOnline: isOnline ?? this.isOnline,
        pushToken: pushToken ?? this.pushToken,
        email: email ?? this.email,
      );

  factory ChatModel.fromRawJson(String str) => ChatModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        image: json["image"] ?? "",
        about: json["about"] ?? "",
        name: json["name"] ?? "",
        createdAt: json["created_at"] ?? "",
        id: json["id"] ?? "",
        lastActive: json["last_active"] ?? "",
        isOnline: json["is_online"] ?? "",
        pushToken: json["push_token"] ?? "",
        email: json["email"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "about": about,
        "name": name,
        "created_at": createdAt,
        "id": id,
        "last_active": lastActive,
        "is_online": isOnline,
        "push_token": pushToken,
        "email": email,
      };
}
