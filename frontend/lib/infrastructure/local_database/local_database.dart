import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/complaint_model/complaint_report.dart';
import '../../models/User_model/user.dart';

class complaintDb {
  late Database database;

// initializing the database
  Future initDB() async {
    String databasesPath = await getDatabasesPath();
    database = await openDatabase(
      join(databasesPath, 'complaint_reporter.db'),
      onCreate: _createDb,
      version: 1,
    );
    return database;
  }

  Future _createDb(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE user(
          fullname TEXT, 
          pasword TEXT,
          role TEXT ,
          
          )''',
    );

    await db.execute(
      '''CREATE TABLE complaint(
          title TEXT, 
         
          description TEXT,
          status TEXT, 
          reporter TEXT,)''',
    );

   
  }

// creating user table
  Future<void> insertUser(User user) async {
    final Database db = database;
    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// creating complaint table
  Future<void> insercomplaint(Report complaint) async {
    final Database db = database;
    await db.insert(
      'complaint',
      complaint.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //  user crud operations
  Future<List<User>> getusers() async {
  final Database db = database;
  final List<Map<String, dynamic>> maps = await db.query('trans');
  return List.generate(maps.length, (i) {
    return User(
      userId: maps[i]['userId'],
      fullname: maps[i]['fullname'],
      email: maps[i]['email'],
      password: maps[i]['password'],
      role: maps[i]['role'],
    );
  });
}

  Future<void> updateUser(User user) async {
    final db = database;
    await db.update(
      'user',
      user.toMap(),
      where: "password = ?",
      whereArgs: [user.password],
    );
  }

  Future<void> deleteUser(int password) async {
    final db = database;
    await db.delete(
      'user',
      where: "password = ?",
      whereArgs: [password],
    );
  }

// complaint crud operations
  Future<List<Report>> getcomplaints() async {
    final Database db = database;
    final List<Map<String, dynamic>> maps = await db.query('trans');
    return List.generate(maps.length, (i) {
      return Report(
         
          reporter: maps[i]['reporter'],
          description: maps[i]['description'],
          complaintId: maps[i]['_id'],
          title: maps[i]['title'],
          status: maps[i]['status']);
    });
  }

  Future<void> updatecomplaint(Report complaint) async {
    final db = database;
    await db.update(
      'complaint',
      complaint.toMap(),
      where: "_id = ?",
      whereArgs: [complaint.complaintId],
    );
  }

  Future<void> deletecomplaint(int id) async {
    final db = database;
    await db.delete(
      'complaint',
      where: "id = ?",
      whereArgs: [id],
    );
  }


  
}