import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../home/data/models/user_modele.dart';

class ProfileDataSources {
  Future<UserModel> getUserData() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'charlieSolutions.db');
    Database database = await openDatabase(dbPath);
    List<Map<String, dynamic>> tableData =
        await database.query("user", where: "id = '1'");
    await database.close();
    if (tableData.isNotEmpty) {
      UserModel user = UserModel.fromJson2(tableData.first);
      return user;
    } else {
      return UserModel(
          id: '1',
          age: 0,
          picture: '',
          name: '',
          phone: '',
          locations: '',
          email: '');
    }
  }

  Future<bool> hasProfile() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'charlieSolutions.db');
    Database database = await openDatabase(dbPath);
    List<Map<String, dynamic>> tableData =
        await database.query("user", where: "id = '1'");
    await database.close();
    if (tableData.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> insertUserData(UserModel user) async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'charlieSolutions.db');

    Database database = await openDatabase(dbPath);
    await database.insert('user', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    await database.close();
  }
}
