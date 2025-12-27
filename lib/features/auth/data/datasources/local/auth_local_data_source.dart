import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> getCachedUser();
  Future<void> cacheUser(UserModel user, {bool rememberMe = true});
  Future<void> clearCache();
  Future<bool> isSignedIn();
  Future<bool> isRemembered();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String cachedUserKey = 'CACHED_USER';
  static const String isSignedInKey = 'IS_SIGNED_IN';
  static const String isRememberedKey = 'IS_REMEMBERED';

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final jsonString = sharedPreferences.getString(cachedUserKey);
      if (jsonString != null) {
        return UserModel.fromJson(json.decode(jsonString));
      }
      return null;
    } catch (e) {
      throw CacheException('Failed to get cached user: $e');
    }
  }

  @override
  Future<void> cacheUser(UserModel user, {bool rememberMe = true}) async {
    try {
      final jsonString = json.encode(user.toJson());
      await sharedPreferences.setString(cachedUserKey, jsonString);
      await sharedPreferences.setBool(isSignedInKey, true);
      await sharedPreferences.setBool(isRememberedKey, rememberMe);
    } catch (e) {
      throw CacheException('Failed to cache user: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await sharedPreferences.remove(cachedUserKey);
      await sharedPreferences.setBool(isSignedInKey, false);
      await sharedPreferences.remove(isRememberedKey);
    } catch (e) {
      throw CacheException('Failed to clear cache: $e');
    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      return sharedPreferences.getBool(isSignedInKey) ?? false;
    } catch (e) {
      throw CacheException('Failed to check sign in status: $e');
    }
  }

  @override
  Future<bool> isRemembered() async {
    try {
      return sharedPreferences.getBool(isRememberedKey) ?? true;
    } catch (e) {
      throw CacheException('Failed to check remember status: $e');
    }
  }
}
