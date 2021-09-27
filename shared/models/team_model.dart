import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TeamModel {
  String id;
  String name;
  String mainInfo;
  String info;
  String link;
  String creatorId;
  DocumentReference<Map<String, dynamic>> ref;
  TeamModel({
    required this.id,
    required this.name,
    required this.mainInfo,
    required this.info,
    required this.link,
    required this.creatorId,
    required this.ref,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mainInfo': mainInfo,
      'info': info,
      'link': link,
      'creatorId': creatorId,
    };
  }

  static ModelMap({
    required name,
    required mainInfo,
    required info,
    required link,
    required creatorId,
  }) {
    return {
      'name': name,
      'mainInfo': mainInfo,
      'info': info,
      'link': link,
      'creatorId': creatorId,
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map, String id,
      DocumentReference<Map<String, dynamic>> ref) {
    return TeamModel(
      id: id,
      name: map['name'],
      mainInfo: map['mainInfo'],
      info: map['info'],
      link: map['link'],
      creatorId: map['creatorId'],
      ref: ref,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source, String id,
          DocumentReference<Map<String, dynamic>> ref) =>
      TeamModel.fromMap(json.decode(source), id, ref);
}
