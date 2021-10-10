import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strapi_flutter_internation_poc/app/common/services/language_service.dart';
import 'package:strapi_flutter_internation_poc/generated/locales.g.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.getAllVegetables();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.app_name.tr),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.dialog(SimpleDialog(
                  title: Text(LocaleKeys.locale_title.tr),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {
                        LanguageService.to.changeLocale(Locale('en', 'US'));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text(LocaleKeys.locale_en.tr),
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        LanguageService.to.changeLocale(Locale('zh', 'CN'));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text(LocaleKeys.locale_zh.tr),
                      ),
                    ),
                  ],
                ));
              },
              icon: Icon(Icons.language))
        ],
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.vegetables.value.length,
          itemBuilder: (context, index) {
            var vegetable = controller.vegetables.value[index];
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      // color: Colors.red,
                      child: Image.asset(
                        'strapi/public/uploads/thumbnail_${vegetable.hash}${vegetable.ext}',
                        fit: BoxFit.contain,
                        width: 140,
                        height: 140,
                      ),
                    ),
                    Container(
                      width: Get.width - 18 * 2 - 140 - 18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vegetable.name,
                            style: Get.textTheme.headline6,
                          ),
                          Text(
                            vegetable.desc!,
                            style: Get.textTheme.subtitle1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
