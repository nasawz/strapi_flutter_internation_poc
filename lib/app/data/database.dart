import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
// daos
import 'dao/vegetable_dao.dart';
// entitys
import 'entity/vegetable.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Vegetable], views: [VegetableV])
abstract class AppDatabase extends FloorDatabase {
  VegetableDao get vegetableDao;
}
