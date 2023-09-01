import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/form_que_model.dart';
import '../../models/show_disease_model.dart';

class ApiServices {
  static Future<DiseaseModel?> getDisease() async {
    final response = await http.get(
        Uri.parse('https://preview.ekrambdproject.xyz/doctor/api/diseases'));
    if (response.statusCode == 200) {
      print('Response ${response.body}');
      return diseaseModelFromJson(response.body);
    } else {
      print('Failed ${response.body}');
      return null;
    }
  }

  static Future<FormQueModel?> showFormQue(id) async {
    final Uri url = Uri.parse(
        'https://preview.ekrambdproject.xyz/doctor/api/get-questions/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return formQueModelFromJson(response.body);
    } else {
      print('Error ${response.body}');
      return null;
    }
  }

  static Future<int?> storePatient(id, name, int age) async {
    final Uri url = Uri.parse(
        'https://preview.ekrambdproject.xyz/doctor/api/store-patient');
    Map data = {
      'disease_id': id,
      'name': name,
      'age': age,
    };
    final response = await http.post(url, body: data);
    if(response.statusCode == 200){
      print(response.body);
      final decode = jsonDecode(response.body);
      return decode['patient_id'];
    } else {
      print('Error Store ${response.body}');
      return null;
    }
  }
  
  static Future<bool?> storeAnswer(id, name, age) async {
    final Uri url = Uri.parse(
        'https://preview.ekrambdproject.xyz/doctor/api/store-patient');
    Map data = {
      'disease_id': id,
      'name': name,
      'age': age,
    };
    final response = await http.post(url, body: data);
    if(response.statusCode == 200){
      print(response.body);
      return true;
    } else {
      print('Error Store ${response.body}');
      return false;
    }
  }
}