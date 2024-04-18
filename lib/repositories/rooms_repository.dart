import 'package:connector/database/db.dart';
import 'package:connector/models/room.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class RoomsRepository {
  late Database db;
  var rooms = <Room>[].obs;

  getAll() async {
    db = await DB.instance.database;

    var response = await db.query('rooms');

    rooms.clear();

    rooms.addAll(response.map((e) => Room.fromJson(e)));
  }

  find(int id) async {
    db = await DB.instance.database;

    var response = await db.query('rooms', where: 'id = ?', whereArgs: [id]);

    if (response[0]['id'] != null) {
      return Room.fromJson(response[0]);
    }

    return null;
  }

  add(Room room) async {
    db = await DB.instance.database;

    await db.insert('rooms', room.toJson());

    rooms.add(room);
  }

  update(Room room) async {
    db = await DB.instance.database;

    await db
        .update('rooms', room.toJson(), where: 'id = ?', whereArgs: [room.id]);
  }

  remove(Room room) async {
    db = await DB.instance.database;

    await db.delete('rooms', where: 'id = ?', whereArgs: [room.id]);

    rooms.remove(room);
  }
}
