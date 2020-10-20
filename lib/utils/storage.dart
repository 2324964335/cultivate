import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginModel.dart';
import '../utils/log_util.dart';
/// 本地存储
class StorageUtil {

  final userToken = 'userToken';

  static StorageUtil _instance = new StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences _prefs;

  StorageUtil._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  /// 设置 json 对象
  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  /// 获取 json 对象
  dynamic getJSON(String key) {
    String jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  /// 删除 json 对象
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  ///获取用户对象
  dynamic getUserModel(){
    String jsonString = _prefs.getString(userToken);
     if (jsonString != null){
       Map<String, dynamic> user = jsonDecode(jsonString);
       return UserModel.fromMap(user);
     }else{
       return null;
     }
  }

  UserModel getSureUserModel(){
    String jsonString = _prefs.getString(userToken);
      Map<String, dynamic> user = jsonDecode(jsonString);
      return UserModel.fromMap(user);
  }

  /// 设置 json 对象
  Future<bool> setUserJSON(dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    LogUtil.d(jsonString);
    return _prefs.setString(userToken, jsonString);
  }

  /// 删除登录对象对象
  Future<bool> removeLogin() {
    return _prefs.remove(userToken);
  }
}
