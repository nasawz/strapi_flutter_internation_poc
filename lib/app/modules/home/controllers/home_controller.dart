import 'package:get/get.dart';
import 'package:strapi_flutter_internation_poc/app/common/services/db_service.dart';
import 'package:strapi_flutter_internation_poc/app/common/services/language_service.dart';
import 'package:strapi_flutter_internation_poc/app/data/entity/vegetable.dart';

class HomeController extends GetxController {
  final vegetables = Rx<List<VegetableV>>([]);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getAllVegetables() async {
    final result = await DbService.to.db.vegetableDao
        .findAll(LanguageService.to.localeKey);
    vegetables.value = result;
  }

  @override
  void onClose() {}
}
