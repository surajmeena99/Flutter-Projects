import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'notes_model.dart'; // Import the modified Notes class

class DatabaseHelper {
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
    String path = join(documentDirectory.path, 'Notess_database.db');
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE Notess(id INTEGER PRIMARY KEY, name TEXT, NotesNo TEXT, description TEXT, image TEXT)',
    );
  }

  Future<void> insertNotes(Notes Notes) async {
    Database? database = await dbMethod;
    if (database != null) {
      await database.insert(
        'Notess',
        Notes.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Insert Printing ID :  ${Notes.toMap()}");
    }
  }

  Future<List<Notes>> getAllNotess() async {
    Database? database = await dbMethod;
    if (database != null) {
      final List<Map<String, dynamic>> maps = await database.query('Notess');
      return maps.map((index) => Notes.fromMap(index)).toList();
    }
    return [];
  }

  Future<void> updateNotes(Notes Notes) async {
    Database? database = await dbMethod;
    if (database != null) {
      await database.update(
        'Notess',
        Notes.toMap(),
        where: 'id = ?',
        whereArgs: [Notes.id],
      );
      print("Update Printing ID :  ${Notes.toMap()}");
    }
  }

  Future<void> deleteNotes(int id) async {
    Database? database = await dbMethod;
    if (database != null) {
      await database.delete(
        'Notess',
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }
}
