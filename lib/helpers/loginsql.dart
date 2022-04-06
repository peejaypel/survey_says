import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import '../models/user.dart';

class LoginSQLHelper{
  static Database? _database;

  // make this a singleton class
  LoginSQLHelper._privateConstructor();
  static final LoginSQLHelper instance = LoginSQLHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = 'surveysays_database.db';
    return await openDatabase(path,
        version: 1,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE users('
          'userId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
          'username TEXT, '
          'password TEXT)',
    );
    print("LoginSQL: TABLE CREATED");
  }

  //Tools
  Future<void> addUser(User user) async {
    final db = await database;
    await db?.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //return all users as list
  Future<List<User>> users() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db!.query('users');

    return List.generate(maps.length, (i) {
      return User(
        username: maps[i]['username'],
        password: maps[i]['password'],
      );
    });
  }

  //check if user exists using username
  Future<bool> hasUser(User user) async{
    Database? db = await database;
    print("username is " + user.username);
    var queryResult = await db!.rawQuery('SELECT * FROM users WHERE username="${user.username}"');
    print("ABCDEFG");
    if (queryResult.isEmpty) return false;
    return true;
  }

  Future<bool> login(User user) async{
    Database? db = await database;
    print("LOGGING IN is " + user.username);
    var queryResult = await db!.rawQuery('SELECT * FROM users WHERE username="${user.username}"');
    print(queryResult.asMap().entries.first.value["password"]);
    if (queryResult.asMap().entries.first.value["password"] == user.password){
      return true;
    }
    return false;
  }
}


