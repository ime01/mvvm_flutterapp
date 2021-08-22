
import 'package:mvvm_flutterapp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{


   static late SharedPreferences _preferences;


   static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setVisitingFlag(bool visited) async{
   await _preferences.setBool(AppConstants.visitedKey, visited);
  }

  static Future setUserName(String username) async{
    await _preferences.setString(AppConstants.nameKey, username);
  }

  static getVisitingFlag() {
    //if user had visited app value would have asssigned, else we say false
      bool? alreadyVisited = _preferences.getBool(AppConstants.visitedKey) ?? false;
    return alreadyVisited;
  }

  static getUserName() {
    var name = _preferences.getString(AppConstants.nameKey);
   return name;
  }



}