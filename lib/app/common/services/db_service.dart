import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:floor/floor.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:strapi_flutter_internation_poc/app/data/database.dart';

class DbService extends GetxService {
  static DbService get to => Get.find();

  late AppDatabase db;

  Future<DbService> init() async {
    final callback = Callback(
      onCreate: (database, version) {},
      onOpen: (database) {
        print('onOpen database');
        getDatabasesPath().then((value) => print(value));
      },
      onUpgrade: (database, startVersion, endVersion) {},
    );

    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "app_database.db");

    await deleteDatabase(dbPath);

    ByteData data = await rootBundle.load("assets/db/data.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

    db = await $FloorAppDatabase
        .databaseBuilder(dbPath)
        .addCallback(callback)
        .build();
    return this;
  }
}
