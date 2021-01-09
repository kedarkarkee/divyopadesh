import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DatabaseHelper {
  static Database _db;
  static const String DATABASE_FILE_NAME = 'up.db';
  static const String MAIN_TABLE_NAME = 'geeta';

  static Future<String> getDatabasePath() async {
    return Path.join(await getDatabasesPath(), DATABASE_FILE_NAME);
  }

  static Future<Database> initDatabase() async {
    if (_db == null || !_db.isOpen) {
      _db = await openDatabase(
        await getDatabasePath(),
      );
    }
    return _db;
  }

  static void disposeDatabase() {
    _db?.close();
  }
}
