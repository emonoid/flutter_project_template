import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static SharedPreferences? prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

   Future<bool> setLocale(String? locale) async {
    return prefs!.setString("locale", locale!);
  }

   Future<String> getLocale() async {
    return prefs!.getString("locale") ?? 'en'; // en
  }

   Future<bool> setTheme(String theme) async {
    return prefs!.setString("theme", theme);
  }

   Future<String> getTheme() async {
    return prefs!.getString("theme") ?? "light";
  }

  static Future<bool> setLoginFlag(bool flag) async {
    return prefs!.setBool("isLoggedIn", flag);
  }

  static Future<bool> getLoginFlag() async {
    return prefs!.getBool("isLoggedIn") ?? false;
  }

  static Future<bool> setSubcriptionStatus(String accountsType) async {
    return prefs!.setString("accounts_type", accountsType);
  }

  static Future<String> get() async {
    return prefs!.getString("accounts_type") ?? ''; // 4293467747
  }

  static Future<bool> setToken(String? token) async {
    return prefs!.setString("accesstoken", token!);
  }

  static Future<String> getToken() async {
    return prefs!.getString("accesstoken") ?? ''; // 4293467747
  }

  static Future<bool> setRefreshToken(String? token) async {
    return prefs!.setString("refreshtoken", token!);
  }

  static Future<String> getRefreshToken() async {
    return prefs!.getString("refreshtoken") ?? ''; // 4293467747
  }

  static Future<bool> setLoginUserId(int userId) async {
    return prefs!.setInt("loginUserId", userId);
  }

  static Future<int> getLoginUserId() async {
    return prefs!.getInt("loginUserId") ?? 0;
  }

  static Future<bool> setLoginUserName(username) async {
    return prefs!.setString("user_name", username ?? '');
  }

  static Future<String> getLoginUserName() async {
    return prefs!.getString("user_name") ?? '';
  }

  static Future<bool> setLoginUserMobileNo(mobileno) async {
    return prefs!.setString("user_mobile_no", mobileno ?? '');
  }

  static Future<String> getLoginUserMobileNo() async {
    return prefs!.getString("user_mobile_no") ?? '';
  }

  static Future<bool> setUserAddress(String userAddress) async {
    return prefs!.setString("address", userAddress);
  }

  static Future<String> getUserAddress() async {
    return prefs!.getString("address") ?? '';
  }

  static Future<bool> setShopId(int shopId) async {
    return prefs!.setInt("shop_id", shopId);
  }

  static Future<int?> getShopId() async {
    return prefs!.getInt("shop_id");
  }

  static Future<bool> setUserId(int userId) async {
    return prefs!.setInt("userId", userId);
  }

  static Future<int?> getUserId() async {
    return prefs!.getInt("userId");
  }

  static Future<bool> setRole(String role) async {
    return prefs!.setString("role", role);
  }

  static Future<String> getRole() async {
    return prefs!.getString("role") ?? "emp";
  }
}
