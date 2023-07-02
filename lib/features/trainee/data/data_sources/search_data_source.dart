import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../home/data/models/user_modele.dart';

class SearchDataSource {
  Future<List<UserModel>> getUsersData(String value) async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'charlieSolutions.db');
    Database database = await openDatabase(dbPath);
    List<Map<String, dynamic>> tableData;

    if (value.isEmpty) {
      tableData = await database.query("user", where: "id != '1'");
    } else {
      tableData = await database.query("user",
          where: "id != '1' AND name LIKE '%$value%'");
    }
    await database.close();

    List<UserModel> users =
        tableData.map((data) => UserModel.fromJson2(data)).toList();
    return users;
  }

  Future<void> deleteMath(String id) async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'charlieSolutions.db');
    Database database = await openDatabase(dbPath);

    await database.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );

    await database.close();
  }
}
