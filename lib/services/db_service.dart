import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseHelper {
  Future<void> init();

  Future<List<Map<String, Object?>>> readAll();

  Future<Map<String, Object?>> readOne(String id);

  Future<void> create(Map<String, Object?> item);

  Future<void> update(Map<String, Object?> item, String id);

  Future<void> delete(String id);
}

class SqlDatabase extends DatabaseHelper {
  final dbName = 'todo_database.db';
  late final Future<Database> database;

  @override
  Future<void> init() async {
    String pathDirectory = await getDatabasesPath();
    String path = join(pathDirectory, dbName);

    database = openDatabase(path, onCreate: _onCreate, version: 1);
  }

  static Future<void> _onCreate(Database db, int version) {
    return db.execute(
      'CREATE TABLE todos(id TEXT PRIMARY KEY, title TEXT, description TEXT, isComplete INTEGER, createdAt TEXT, updatedAt TEXT)',
    );
  }

  @override
  Future<void> create(Map<String, Object?> item) async {
    final db = await database;
    await db.insert(
      'todos',
      item,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> delete(String id) async {
    final db = await database;

    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Map<String, Object?>>> readAll() async {
    final db = await database;
    return await db.query('todos');
  }

  @override
  Future<Map<String, Object?>> readOne(String id) async {
    final db = await database;
    final data = await db.query(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data.first;
  }

  @override
  Future<void> update(Map<String, Object?> item, String id) async {
    final db = await database;
    await db.update(
      'todos',
      item,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
