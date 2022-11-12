import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_ish/model/model.dart';

class HiveService {
  static const String boxName = 'db';
  static const String dataName = "users";

  // save service
  static Future<void> saveData(List<User> user) async {
    var box = Hive.box(boxName);
    List<Map<String, dynamic>> json = user.map((e) => e.toJson()).toList();
    box.put(dataName, jsonEncode(json));
  }

  static List<User> getData() {
    var box = Hive.box(boxName);
    String data = box.get(dataName, defaultValue: '[]');
    List json = jsonDecode(data);
    List<User> userlist = json.map((e) => User.fromJson(e)).toList();
    return userlist;
  }
}
