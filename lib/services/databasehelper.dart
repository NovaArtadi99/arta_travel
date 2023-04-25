import 'package:travel/models/place.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  late Database db;

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'places.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE places (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              description TEXT NOT NULL,
              price REAL NOT NULL,
              imageUrl TEXT NOT NULL,
              category TEXT NOT NULL,
              location TEXT NOT NULL,
              code TEXT
            )
          """,
        );
      },
      version: 1,
    );
  }

  Future<int> insertPlace(Place place) async {
    int result = await db.insert('places', place.toMap());
    return result;
  }

  Future<int> updatePlace(Place place) async {
    int result = await db.update(
      'places',
      place.toMap(),
      where: "id = ?",
      whereArgs: [place.id],
    );
    return result;
  }

  Future<List<Place>> retrievePlaces() async {
    final List<Map<String, Object?>> queryResult = await db.query('places');
    return queryResult.map((e) => Place.fromMap(e)).toList();
  }

  Future<void> deletePlace(int id) async {
    await db.delete(
      'places',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
