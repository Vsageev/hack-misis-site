import 'dart:convert';

class UserModel {
  String tgLink;
  UserModel({
    required this.tgLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'tgLink': tgLink,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      tgLink: map['tgLink'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
