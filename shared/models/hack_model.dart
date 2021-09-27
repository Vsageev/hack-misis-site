import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class HackModel {
  String id;
  String name;
  String link;
  String startDate;
  String endDate;
  String registrationEnd;
  HackModel({
    required this.id,
    required this.name,
    required this.link,
    required this.startDate,
    required this.endDate,
    required this.registrationEnd,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'link': link,
      'startDate': startDate,
      'endDate': endDate,
      'registrationEnd': registrationEnd,
    };
  }

  factory HackModel.fromMap(Map<String, dynamic> map, String id) {
    return HackModel(
      id: id,
      name: map['name'],
      link: map['link'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      registrationEnd: map['registrationEnd'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HackModel.fromJson(String source, String id) =>
      HackModel.fromMap(json.decode(source), id);
}
