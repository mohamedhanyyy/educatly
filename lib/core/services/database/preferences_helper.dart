import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskaty/features/shared/auth/login/data/model/auth_response.dart';

class PreferencesHelper {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveLoginDate() async {
    await preferences?.setString(
        'loginDate', '${DateTime.now().add(Duration(days: 10))}');
    debugPrint('HANY ${preferences?.getString('loginDate')}');
  }

  static String? get getLoginDate {
    return preferences?.getString('loginDate') ?? DateTime.now().toString();
  }

  static Future<void> saveToken({required String token}) async {
    await preferences?.setString('token', token);
  }

  static String? get getToken {
    return preferences?.getString('token');
  }

  static Future<void> saveLang({required String lang}) async {
    await preferences?.setString('lang', lang);
  }

  static String get getLang {
    return preferences?.getString('lang') ?? 'en';
  }

  static Future<void> saveTheme({required String theme}) async {
    await preferences?.setString('theme', theme);
  }

  static String? get getTheme {
    return preferences?.getString('theme');
  }

  static Future<void> saveUserModel({AuthResponse? userModel}) async {
    await preferences?.setString('userModel', json.encode(userModel));
  }

  static AuthResponse? get getUserModel {
    if (preferences?.getString('userModel') != null) {
      return AuthResponse.fromJson(
          json.decode('${preferences?.getString('userModel')}'));
    }
    return null;
  }

  static String get getName {
    AuthResponse? userModel = AuthResponse.fromJson(
        json.decode('${preferences?.getString('userModel')}'));
    return userModel.fullName ?? '';
  }

  static String get getMail {
    AuthResponse? userModel = AuthResponse.fromJson(
        json.decode('${preferences?.getString('userModel')}'));
    return userModel.email ?? '';
  }

  static void logOut() {
    preferences?.remove('token');
    preferences?.remove('userModel');
    preferences?.remove('keepMeLogged');
    preferences?.remove('isVisitor');
    preferences?.setBool('isVisitor', false);
  }
}
