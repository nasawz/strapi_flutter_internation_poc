import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService extends GetxService {
  static LanguageService get to => Get.find();

  var box = GetStorage();
  var locale = Locale('en', 'US');
  var localeKey = 'en';

  Future<LanguageService> init() async {
    if (box.read('language') != null) {
      if (box.read('language') == 'zh-CN') {
        locale = Locale('zh', 'CN');
        localeKey = 'zh-CN';
      } else {
        locale = Locale('en', 'US');
        localeKey = 'en';
      }
    } else {
      if (ui.window.locale.languageCode == 'zh') {
        locale = Locale('zh', 'CN');
        localeKey = 'zh-CN';
      } else {
        locale = Locale('en', 'US');
        localeKey = 'en';
      }
    }

    return this;
  }

  void changeLocale(l) {
    if (l == Locale('zh', 'CN')) {
      localeKey = 'zh-CN';
      updateLocale(Locale('zh', 'CN'));
    } else if (l == Locale('en', 'US')) {
      localeKey = 'en';
      updateLocale(Locale('en', 'US'));
    }
    box.write('language', localeKey);
  }

  void updateLocale(_l) {
    locale = _l;
    Get.updateLocale(_l);
  }
}
