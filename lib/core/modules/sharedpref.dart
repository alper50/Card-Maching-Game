import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences _sharedPreff;

  Future<void> createSharedd()async{
    _sharedPreff = await SharedPreferences.getInstance();
   }
  void saveToSharedint(int value,String dataname) {
    _sharedPreff.setInt("$dataname", value);
  }

  loadFromSharedint(String getdata) async {
    int point;
    point = _sharedPreff.getInt("$getdata") ?? 0;
    return point;
  }
}
