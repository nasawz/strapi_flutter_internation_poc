import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/common/services/db_service.dart';
import 'app/common/services/language_service.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: LanguageService.to.locale,
      fallbackLocale: Locale('zh', 'CN'),
    ),
  );
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => DbService().init());
  await Get.putAsync(() => LanguageService().init());
  print('All services started...');
}
