import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import '../models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'surveysays_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users('
            'userId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
            'username TEXT, '
            'password TEXT)',
      );
    },
    version: 1,
  );

  Future<void> addUser(User user) async {
    // Get a reference to the database.
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<User>> users() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
        userId: maps[i]['userId'],
        username: maps[i]['username'],
        password: maps[i]['password'],
      );
    });
  }
}