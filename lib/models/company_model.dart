// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

CompanyModel companyModelFromJson(String str) =>
    CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  CompanyModel({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.v,
  });

  String id;
  String name;
  String email;
  DateTime createdAt;
  int v;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}
