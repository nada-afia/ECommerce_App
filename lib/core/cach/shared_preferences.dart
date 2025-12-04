// Obtain shared preferences.
import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesUtils{
  static late  SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init() async {
   return sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> saveData({required String key,required dynamic value}) async {
    if(value is int){
      return await sharedPreferences.setInt(key, value);
    } else if(value is double){
      return await sharedPreferences.setDouble(key, value);
    }else if(value is String){
      return await sharedPreferences.setString(key, value);
    }else{
      return await sharedPreferences.setBool(key, value);
    }
  }
static Object? getData({required String key}){
    return sharedPreferences.get(key);
}
static removeData({required String key}) async {
    return await sharedPreferences.remove(key);
}
}
