import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/geeta.dart';
import '../controllers/database-helper.dart';

class BookmarkManager with ChangeNotifier {
  List<Geeta> _bookmarks;

  void _loadBookmark() {
    DatabaseHelper.initDatabase().then((Database db) {
      db.query(DatabaseHelper.MAIN_TABLE_NAME,
          where: 'isBookmark=?',
          whereArgs: [1]).then((List<Map<String, dynamic>> maps) {
        _bookmarks = List.generate(maps.length, (i) {
          return Geeta(
              chapter: maps[i]['book'],
              verse: maps[i]['verse'],
              data: maps[i]['data'],
              color: maps[i]['color']);
        });
        notifyListeners();
      });
    }).catchError((err) {
      _bookmarks = [];
    });
  }

  List<Geeta> get bookmarks {
    if (_bookmarks == null) {
      _bookmarks = [];
    }
    return _bookmarks;
  }

  Future<void> setBookmark(int chapter, List<int> verses) async {
    final Database db = await DatabaseHelper.initDatabase();
    for (var verse in verses) {
      await db.update(DatabaseHelper.MAIN_TABLE_NAME, {'isBookmark': 1},
          where: 'book=? and verse=?', whereArgs: [chapter, verse]);
    }
    notifyListeners();
    _loadBookmark();
  }

  Future<void> deleteBookmark(int chapter, int verse) async {
    final Database db = await DatabaseHelper.initDatabase();
    await db.update(DatabaseHelper.MAIN_TABLE_NAME, {'isBookmark': 0},
        where: 'book=? and verse=?', whereArgs: [chapter, verse]);
    notifyListeners();
    _loadBookmark();
  }
}
