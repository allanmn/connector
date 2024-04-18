import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'connector.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_rooms);
  }

  String get _rooms => '''
    create table if not exists rooms(
    id INTEGER PRIMARY KEY,
    `name` TEXT NOT NULL,
    width INTEGER,
    height INTEGER,
    position_x INTEGER DEFAULT 0,
    position_y INTEGER DEFAULT 0,
    color TEXT,
    legacy_link_speed REAL DEFAULT 0,
    legacy_link_strength REAL DEFAULT 0,
    link_speed REAL DEFAULT 0,
    link_strength REAL DEFAULT 0,
    interference TEXT DEFAULT 0
);
  ''';
}
