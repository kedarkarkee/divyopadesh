import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontManager with ChangeNotifier {
    double _fontSize;
  final _kFontPreference = "font_preference";

  FontManager(){
    _loadFont();
  }
  void _loadFont(){
    SharedPreferences.getInstance().then((prefs){
      double preferredFont = prefs.getDouble(_kFontPreference)??16.0;
      _fontSize = preferredFont;
      notifyListeners();
    });
  }
  
  double get fontSize{
    if(_fontSize == null){
      _fontSize = 16.0;
    }
    return _fontSize;
  }
  Future<void> setFont(double font)async{
    _fontSize = font;
    notifyListeners();
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(_kFontPreference,font);
  }

}