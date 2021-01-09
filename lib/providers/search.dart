import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/geeta.dart';
import '../controllers/database-helper.dart';

class SearchProvider with ChangeNotifier {
  List<Geeta> _lists = [];
  // List<String> lang = ['sanskrit', 'nepali', 'english'];
  bool _isSearchPressed = false;
  List<Geeta> get lists => _lists;
  bool get isSearchPressed => _isSearchPressed;

  Future<void> searchData(String text) async {
    final Database db = await DatabaseHelper.initDatabase();
    final List<Map<String, dynamic>> maps = await db
        .rawQuery('SELECT * FROM geeta WHERE sanskrit LIKE ?', ['%$text%']);
    _lists.clear();
    List.generate(maps.length, (i) {
      return _lists.add(Geeta(
          chapter: maps[i]['book'],
          verse: maps[i]['verse'],
          data: maps[i]['sanskrit'],
          color: maps[i]['color']));
    });
    _isSearchPressed = true;
    notifyListeners();
  }

  void clear() {
    _lists.clear();
    _isSearchPressed = false;
  }
}
