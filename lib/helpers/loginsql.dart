import 'dart:async';
import 'package:sqflite/sqflite.dart';
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

  //erorr on survey says db new version
  _initDatabase() async {
    String path = 'surveysays.db';
    return await openDatabase(path,
        version: 3,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE users('
          'userId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
          'email TEXT, '
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
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  //check if user exists using username
  Future<bool> hasUser(User user) async{
    Database? db = await database;
    print("hasUser(): Email is " + user.email);
    var queryResult = await db!.rawQuery('SELECT * FROM users WHERE email ="${user.email}"');
    if (queryResult.isEmpty) return false;
    return true;
  }

  Future<bool> login(User user) async{
    Database? db = await database;
    print("LOGGING IN is " + user.email);
    // var queryResult = await db!.rawQuery('DROP TABLE IF EXISTS users');
    var queryResult = await db!.rawQuery('SELECT * FROM users WHERE email ="${user.email}"');
    print(queryResult.asMap().entries.first.value["password"]);
    if (queryResult.asMap().entries.first.value["password"] == user.password){
      return true;
    }
    return false;
  }
}


