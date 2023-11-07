import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:travel_journel/view/screens/add_new_trip/model/add_trip_model.dart';

class SqLiteService
{
  static final SqLiteService instance = SqLiteService._init();
  SqLiteService._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb('travel_database.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbpath = await getDatabasesPath();
    String path = join(dbpath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  close() async {
    final db = await instance.database;
    db.close();
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE travels(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, city TEXT, country TEXT, startDate TEXT, endDate TEXT, image BLOB, description TEXT, note TEXT, stamp BLOB)');
  }

  Future<void> insertTravel(Travel travel) async {
    final db = await database;
    await db.insert(
      'travels',
      travel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Travel>> travels() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('travels');
    return List.generate(maps.length, (i) {
      return Travel(
          id: maps[i]['id'] as int,
          title: maps[i]['title'] as String,
          city: maps[i]['city'] as String,
          country: maps[i]['country'] as String,
          startDate: maps[i]['startDate'] as String,
          endDate: maps[i]['endDate'] as String,
          image: maps[i]["image"],
          description: maps[i]['description'] as String,
          note: maps[i]['note'] as String,
          stamp: maps[i]["stamp"],
          stampUrl: ''
      );
    });
  }

  Future<Travel> readTravel(int id) async {
    final db = await instance.database;
    final maps = await db.query("travels",
        columns: ['id', 'title', 'city', 'country', 'startDate', 'endDate', 'image', 'description', 'note', 'stamp'],
        where: "id = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Travel.formMap(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<int> updateTrip(Travel travel) async {
    final db = await instance.database;
    return db.update("travels", travel.toMap(),
        where: "id = ?", whereArgs: [travel.id]);
  }

  Future<int> deleteTrip(int id) async {
    final db = await instance.database;
    return db.delete("travels", where: "id = ?", whereArgs: [id]);
  }
}