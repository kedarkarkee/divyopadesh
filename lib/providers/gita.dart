import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle, ByteData;
import 'package:path/path.dart' as Path;

import '../models/geeta.dart';
// import '../models/audio.dart';
import '../controllers/database-helper.dart';
import '../controllers/sharedprefs.dart';

class Gita with ChangeNotifier {
  List<Geeta> _items = [];

  List<Geeta> get items => _items;
  int book = 1;

  Gita() {
    copyData();
  }

  Future<void> initializeSavedState() async {
    final savedState = await getSavedState();
    book = savedState ?? 1;
  }

  Future<void> fetchAndSetData(int book) async {
    if (!(await databaseExists(await DatabaseHelper.getDatabasePath()))) {
      print('database doesn\'t exist');
      return;
    }
    final Database db = await DatabaseHelper.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
        DatabaseHelper.MAIN_TABLE_NAME,
        where: 'book=?',
        whereArgs: [book]);
    _items = List.generate(maps.length, (i) {
      return Geeta(
        chapter: maps[i]['book'],
        verse: maps[i]['verse'],
        data: maps[i]['data'],
        color: maps[i]['color'],
      );
    });
    this.book = book;
    notifyListeners();
    await setSavedState(book);
  }

  void nextPage() {
    fetchAndSetData(book + 1);
  }

  void previousPage() {
    fetchAndSetData(book - 1);
  }

  Future<bool> copyData() async {
    String path = await DatabaseHelper.getDatabasePath();
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle
          .load(Path.join('assets', DatabaseHelper.DATABASE_FILE_NAME));
      File file = new File(path);
      final Uint8List bytes = Uint8List(data.lengthInBytes);
      bytes.setRange(0, data.lengthInBytes, data.buffer.asUint8List());
      await file.writeAsBytes(bytes);
    }
    await initializeSavedState();
    fetchAndSetData(book);
    return true;
  }

  Future<void> setColor(int color, int chapter, List<int> verses) async {
    final Database db = await DatabaseHelper.initDatabase();
    for (var verse in verses) {
      await db.update(DatabaseHelper.MAIN_TABLE_NAME, {'color': color},
          where: 'book=? and verse=?', whereArgs: [chapter, verse]);
    }
    fetchAndSetData(book);
  }
}
