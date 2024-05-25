import 'dart:async';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../../domain/entities/random_user.dart';
import 'i_user_local_datasource.dart';

class UserLocalDataSourceSqfLite implements IUserLocalDataSource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, gender TEXT, city TEXT, email TEXT, picture TEXT)');
  }

  @override
  Future<void> addUser(RandomUser user) async {
    logInfo("Adding user to db");
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<RandomUser>> getAllUsers() async {
    // Get a reference to the database.
    final db = await database;
    //TODO
    // aqui se debe hacer un query en la tabla users, la base de datos que retorna un List<Map<String, dynamic>> maps

    List<Map<String, dynamic>> maps = <Map<String, dynamic>>[];

    return List.generate(maps.length, (i) {
      return RandomUser(
        id: maps[i]['id'],
        name: maps[i]['name'],
        gender: maps[i]['gender'],
        email: maps[i]['email'],
        city: maps[i]['city'],
        picture: maps[i]['picture'],
      );
    });
  }

  @override
  Future<void> deleteUser(id) async {
    Database db = await database;
    //TODO
    // aquí se debe llamar al db.delete usando el where con el id  - tabla users
  }

  @override
  Future<void> deleteAll() async {
    Database db = await database;
    //TODO
    // aquí se debe llamar al db.delete  - tabla users
  }

  @override
  Future<void> updateUser(RandomUser user) async {
    Database db = await database;
    //TODO
    // aquí se debe llamar al db.update actualizando nombre y cuidad usando el where con el id  - tabla users
  }
}
