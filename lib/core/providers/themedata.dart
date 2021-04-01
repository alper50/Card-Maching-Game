import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemeData extends ChangeNotifier{
  bool isdarkmodeon = false;
  static SharedPreferences _sharedPref;
  void updateTheme(){
    isdarkmodeon ==false ? isdarkmodeon = true: isdarkmodeon = false;
    saveToShared(isdarkmodeon);
    notifyListeners();
  }

   Future<void> createShared()async{
    _sharedPref = await SharedPreferences.getInstance();
   }

   void saveToShared(bool value){
     _sharedPref.setBool("themedata", value);
   }

   void loadFromShared()async{
     
       isdarkmodeon=_sharedPref.getBool("themedata") ?? false;
  }
}