// import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:path/path.dart' as path;
// import 'package:sqflite/sqflite.dart' as sqflite;

// class DBManage {
//   String databaseName = 'EzyData.db';

//   Future<sqflite.Database> OpenDataBase() async {
//     var appDocPath = "assets/";
//     var databaseLoc = path.join(appDocPath, this.databaseName);

//     var database = await sqflite.openDatabase(databaseLoc, version: 1,
//         onCreate: (db, version) async {
//       await db.execute('''
//           CREATE TABLE ApiTB(
//             API1 VARCHAR(100) DEFAULT "-",
//             API2 VARCHAR(100) DEFAULT "-",
//             STATUS BOOLEAN DEFAULT false
//           )
//           ''');

//       await db.rawInsert("""
//         INSERT INTO ApiTB(API1,API2,STATUS) VALUES('-','-',false)
//     """);
//     });
//     return database;
//   }

//   setAPI({api1, api2}) async {
//     final db = await OpenDataBase();

//     await db.rawUpdate("""UPDATE ApiTB SET API1 = '$api1', API2 = '$api2'""");
//   }

//   setStatus(status) async {
//     final db = await OpenDataBase();
//     await db.rawUpdate("""UPDATE ApiTB SET STATUS = $status""");
//   }

//   Future<String> getAPI() async {
//     final sqflite.Database db = await OpenDataBase();

//     final List<Map<String, dynamic>> maps = await db.query('ApiTB');

//     List<String> api1_check = List.generate(maps.length, (i) {
//       return maps[i]["API1"].toString();
//     });

//     List<String> api2_check = List.generate(maps.length, (i) {
//       return maps[i]["API2"].toString();
//     });

//     List<dynamic> status_check = List.generate(maps.length, (i) {
//       return maps[i]["STATUS"];
//     });

//     if (status_check.isEmpty) {
//       await db.rawInsert("""
//         INSERT INTO ApiTB(Status) VALUES(false)
//     """);
//     }

//     status_check = List.generate(maps.length, (i) {
//       return maps[i]["STATUS"];
//     });

//     if (status_check[0] == 0) {
//       if (api1_check.isEmpty) {
//         await db.rawInsert("""
//         INSERT INTO ApiTB(Api1) VALUES('-')
//     """);
//         return '-';
//       } else {
//         return api1_check[0].toString();
//       }
//     } else {
//       if (api2_check.isEmpty) {
//         await db.rawInsert("""
//         INSERT INTO ApiTB(Api2) VALUES('-')
//     """);
//         return '-';
//       } else {
//         return api2_check[0].toString();
//       }
//     }
//   }

//   Future<bool> getStatus() async {
//     final sqflite.Database db = await OpenDataBase();

//     final List<Map<String, dynamic>> maps = await db.query('ApiTB');
//     List<dynamic> status_check = List.generate(maps.length, (i) {
//       return maps[i]["STATUS"];
//     });

//     if (status_check[0] == 0) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   Future<String> getAPI1() async {
//     final sqflite.Database db = await OpenDataBase();

//     final List<Map<String, dynamic>> maps = await db.query('ApiTB');

//     List<String> api1_check = List.generate(maps.length, (i) {
//       return maps[i]["API1"].toString();
//     });

//     if (api1_check.isEmpty) {
//       await db.rawInsert("""
//         INSERT INTO ApiTB(Api1) VALUES('-')
//     """);
//       return '-';
//     } else {
//       return api1_check[0].toString();
//     }
//   }

//   Future<String> getAPI2() async {
//     final sqflite.Database db = await OpenDataBase();

//     final List<Map<String, dynamic>> maps = await db.query('ApiTB');

//     List<String> api2_check = List.generate(maps.length, (i) {
//       return maps[i]["API2"].toString();
//     });

//     if (api2_check.isEmpty) {
//       await db.rawInsert("""
//         INSERT INTO ApiTB(Api2) VALUES('-')
//     """);
//       return '-';
//     } else {
//       return api2_check[0].toString();
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBManage {
  initDatabase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('Status') == null) {
      await prefs.setString('API1', '-');
      await prefs.setString('API2', '-');
      await prefs.setBool('Status', false);
    }
  }

  setAPI({@required api1, @required api2}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('API1', api1);
    await prefs.setString('API2', api2);
  }

  setStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('Status', status);
  }

  getAPI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('Status')) {
      return getAPI2();
    } else {
      return getAPI1();
    }
  }

  getAPI1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('API1');
  }

  getAPI2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('API2');
  }

  getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('Status');
  }
}
