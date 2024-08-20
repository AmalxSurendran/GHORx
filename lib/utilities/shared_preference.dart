// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String TOKEN = "TOKEN";

  static setString(String value, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    log("$value is stored in key - $key");
  }

  static Future<String?> getString(var key) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  static clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
