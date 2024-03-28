import 'dart:convert';

import 'package:learning_app/common/entities/user.dart';
import 'package:learning_app/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstans.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedId() {
    return _prefs.getString(AppConstans.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<void> remove(String key) {
    return _prefs.remove(key);
  }

  String getUserToken() {
    return _prefs.getString(AppConstans.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  UserItem? getUserProfile() {
    var profileOnline =
        _prefs.getString(AppConstans.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profileOnline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOnline));
    }

    return null;
  }
}
