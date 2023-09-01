// To parse this JSON data, do
//
//     final formQueModel = formQueModelFromJson(jsonString);

import 'dart:convert';

FormQueModel formQueModelFromJson(String str) => FormQueModel.fromJson(json.decode(str));

String formQueModelToJson(FormQueModel data) => json.encode(data.toJson());

class FormQueModel {
  bool? success;
  String? message;
  int? total;
  List<Datum>? data;

  FormQueModel({
    this.success,
    this.message,
    this.total,
    this.data,
  });

  factory FormQueModel.fromJson(Map<String, dynamic> json) => FormQueModel(
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
  String? diseaseId;
  String? question;
  String? type;

  Datum({
    this.id,
    this.diseaseId,
    this.question,
    this.type,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    diseaseId: json["disease_id"],
    question: json["question"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "disease_id": diseaseId,
    "question": question,
    "type": type,
  };
}
