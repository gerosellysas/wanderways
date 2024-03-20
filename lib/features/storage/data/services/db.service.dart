import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static final DBService instance = DBService._();
  factory DBService() => instance;
  static Database? _db;

  DBService._();

  static const _dbName = "wanderways.db";
  static const _dbVersion = 1;

  static const String _userTable = "user_table";
  static const String _purchaseTable = "purchase_table";

  static const String _colUser1 = "id";
  static const String _colUser2 = "first_name";
  static const String _colUser3 = "last_name";
  static const String _colUser4 = "email";
  static const String _colUser5 = "phone";
  static const String _colUser6 = "password";
  static const String _colUser7 = "created_at";
  static const String _colUser8 = "update_at";

  static const String _colPurchase1 = "id";
  static const String _colPurchase2 = "uid";
  static const String _colPurchase3 = "booking_number";
  static const String _colPurchase4 = "passenger";
  static const String _colPurchase5 = "seat";
  static const String _colPurchase6 = "tid";
  static const String _colPurchase7 = "total_price";
  static const String _colPurchase8 = "payment_status";
  static const String _colPurchase9 = "created_at";
  static const String _colPurchase10 = "paid_at";

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_userTable (
        $_colUser1 INTEGER PRIMARY KEY AUTOINCREMENT,
        $_colUser2 TEXT NOT NULL,
        $_colUser3 TEXT NOT NULL,
        $_colUser4 TEXT NOT NULL,
        $_colUser5 TEXT NOT NULL,
        $_colUser6 TEXT NOT NULL,
        $_colUser7 TEXT NOT NULL,
        $_colUser8 TEXT,
      )
    ''');
    await db.execute('''
      CREATE TABLE $_purchaseTable (
        $_colPurchase1 INTEGER PRIMARY KEY AUTOINCREMENT,
        $_colPurchase2 INTEGER NOT NULL,
        $_colPurchase3 TEXT NOT NULL,
        $_colPurchase4 TEXT NOT NULL,
        $_colPurchase5 TEXT NOT NULL,
        $_colPurchase6 INTEGER NOT NULL,
        $_colPurchase7 TEXT NOT NULL,
        $_colPurchase8 TEXT NOT NULL,
        $_colPurchase9 TEXT NOT NULL,
        $_colPurchase10 TEXT,
      )
    ''');
  }

  Future<List<Map<String, Object?>>> fetchAll(String table) async {
    Database? db = await database;
    return await db.query(
      table,
      orderBy: "id ASC",
    );
  }

  Future<Map<String, Object?>> read(String table, {required int id}) async {
    Database? db = await database;
    var res = await db.rawQuery(
      "SELECT * FROM $table WHERE id = ?",
      [id],
    );
    return res.first;
  }

  Future<int> insert(
    String table, {
    required Map<String, Object?> values,
  }) async {
    Database? db = await database;
    return await db.insert(
      table,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> update(
    String table, {
    required Map<String, Object?> values,
  }) async {
    Database? db = await database;
    return await db.update(
      table,
      values,
      where: "id = ?",
      whereArgs: [values["id"] as int],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> delete(
    String table, {
    required int id,
  }) async {
    Database? db = await database;
    return await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
