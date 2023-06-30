import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_modele.dart';

class ApiDataSources {
  late UserModel user;
  Future<UserModel> getData() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=100'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      user = UserModel.fromJson(data['results'][0]);
      return user;
    } else {
      throw Exception('Erreur de requête : ${response.statusCode}');
    }
  }

  Future<void> insertUserDataFromMath() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'charlieSolutions.db');

    Database database = await openDatabase(dbPath);
    await database.insert('user', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    await database.close();
  }
}
