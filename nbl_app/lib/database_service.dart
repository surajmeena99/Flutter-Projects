import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:nbl_app/user_model.dart';

class DatabaseService {
  static Database? _database;

  Future<Database?> get dbMethod async {
     if (_database != null) {
       return _database;
     }
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'user_database.db');
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, email TEXT, password TEXT, designation TEXT)',
    );
  }

  Future<void> addUser(User user) async {
    Database? database = await dbMethod;
    if (database != null) {
      await database.insert('users', user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<User>> getUsers() async {
    Database? database = await dbMethod;
    if (database != null) {
      final List<Map<String, dynamic>> maps = await database.query('users');
      return maps.map((index) => User.fromMap(index)).toList();
    }
    return [];
  }

  Future<void> updateUser(User user) async {
    Database? database = await dbMethod;
    if (database != null) {
      await database.update('users', user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
    }
  }

  Future<void> deleteUser(int id) async {
    Database? database = await dbMethod;
    if (database != null) {
      await database.delete('users',
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }
}
