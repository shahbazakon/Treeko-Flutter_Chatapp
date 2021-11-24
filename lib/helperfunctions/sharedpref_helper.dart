import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String displayNameKey = "USERDISPLAYNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userProfileKey = "USERPROFILEKEY";

  //-------------------------------------------------------------------Save Data
  static Future<bool> saveUserName(String? getUserName) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName!);
  }

  static Future<bool> saveUserEmail(String getEmail) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getEmail);
  }

  static Future<bool> saveUserId(String getUserId) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  static Future<bool> saveDisplayName(String getDisplayName) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(displayNameKey, getDisplayName);
  }

  static Future<bool> saveUserProfileUrl(String getUserProfile) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userProfileKey, getUserProfile);
  }

  //--------------------------------------------------------------------Get Data
  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<String?> getDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(displayNameKey);
  }

  Future<String?> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userProfileKey);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }
}