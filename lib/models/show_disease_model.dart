// To parse this JSON data, do
//
//     final diseaseModel = diseaseModelFromJson(jsonString);

import 'dart:convert';

DiseaseModel diseaseModelFromJson(String str) => DiseaseModel.fromJson(json.decode(str));

String diseaseModelToJson(DiseaseModel data) => json.encode(data.toJson());

class DiseaseModel {
  bool? success;
  String? message;
  int? total;
  List<Datum>? data;

  DiseaseModel({
    this.success,
    this.message,
    this.total,
    this.data,
  });

  factory DiseaseModel.fromJson(Map<String, dynamic> json) => DiseaseModel(
    success: json["success"],
    message: json["message"],
    total: json["total"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "total": total,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? diseaseName;

  Datum({
    this.id,
    this.diseaseName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    diseaseName: json["disease_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "disease_name": diseaseName,
  };
}
