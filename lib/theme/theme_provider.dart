import 'package:flutter/material.dart';
import 'package:notes_isar/theme/dark_mode.dart';
import 'package:notes_isar/theme/light_mode.dart';



class ThemeProvider extends ChangeNotifier{

  ThemeData _themeData=lightMode;
  ThemeData get themeDate=>_themeData;
  bool get isDarkMode=>_themeData==darkMode;
  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();

  }
  void toggleTheme(){
    if(_themeData==lightMode){
      themeData=darkMode;
    }else{
      themeData=lightMode;
    }
  }
}