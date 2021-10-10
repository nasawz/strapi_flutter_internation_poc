import 'package:floor/floor.dart';

@Entity(tableName: "vegetables")
class Vegetable {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  final String locale;

  final String desc;

  @ColumnInfo(name: 'created_at')
  final int createTime;

  @ColumnInfo(name: 'updated_at')
  final int updateTime;

  Vegetable(
    this.id,
    this.name,
    this.locale,
    this.desc, {
    int? createTime,
    int? updateTime,
  })  : this.createTime = createTime ?? DateTime.now().millisecondsSinceEpoch,
        this.updateTime = updateTime ?? DateTime.now().millisecondsSinceEpoch;
}

@DatabaseView(
    'SELECT	v.id,	v.name,	v.desc,	v.locale,	uf.hash,	uf.ext, 	v.created_at,	v.updated_at from	vegetables v LEFT OUTER JOIN upload_file_morph ufm on	v.id = ufm.related_id LEFT OUTER JOIN upload_file uf on	ufm.upload_file_id = uf.id;',
    viewName: "vegetables_v")
class VegetableV {
  final int id;
  final String name;
  final String locale;
  final String? desc;
  final String? hash;
  final String? ext;

  @ColumnInfo(name: 'created_at')
  final int createTime;

  @ColumnInfo(name: 'updated_at')
  final int updateTime;

  VegetableV(
    this.id,
    this.name,
    this.locale,
    this.desc,
    this.hash,
    this.ext, {
    int? createTime,
    int? updateTime,
  })  : this.createTime = createTime ?? DateTime.now().millisecondsSinceEpoch,
        this.updateTime = updateTime ?? DateTime.now().millisecondsSinceEpoch;
}
