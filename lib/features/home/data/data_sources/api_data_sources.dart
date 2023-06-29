import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_modele.dart';

class ApiDataSources {
  Future<UserModel> getData() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=100'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = UserModel.fromJson(data['results'][0]);
      return user;
    } else {
      throw Exception('Erreur de requête : ${response.statusCode}');
    }
  }
}
