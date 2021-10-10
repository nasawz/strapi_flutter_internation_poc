import 'package:floor/floor.dart';
import 'package:strapi_flutter_internation_poc/app/data/entity/vegetable.dart';

@dao
abstract class VegetableDao {
  @Query('SELECT * FROM vegetables_v WHERE  locale = :locale')
  Future<List<VegetableV>> findAll(String locale);
}
