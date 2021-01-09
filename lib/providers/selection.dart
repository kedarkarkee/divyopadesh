import 'package:flutter/material.dart';

class Selection with ChangeNotifier {
  final List<Color> _textColor = [];
  // final List<String> _selection = [];
  final List<bool> _verses = [];
  final List<int> _list = [];
  // List<String> get selection => _selection;
  List<Color> get textColor => _textColor;
  List<bool> get verses => _verses;
  List<int> get list => _list;
  void selectVerse(int i, String sanskrit) {
    // if (!_selection.remove('$sanskrit\n')) {
    //   _selection.insert(i, '$sanskrit\n');
    // }
    if (_textColor[i] == Colors.red) {
      _textColor[i] = Colors.grey[400];
    } else {
      _textColor[i] = Colors.red;
    }
    if (!_list.remove(i + 1)) {
      _list.add(i + 1);
    }
    _verses[i] = !_verses[i];
    notifyListeners();
  }

  void add(int length) {
    for (var i = 0; i < length; i++) {
      _verses.add(false);
      _textColor.add(Colors.red);
      // _selection.add('');
    }
  }

  void clear() {
    _verses.clear();
    _textColor.clear();
    // _selection.clear();
    _list.clear();
    notifyListeners();
  }
}
