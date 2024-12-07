import 'package:chatbot/core/helper/local_storage.dart';
import 'package:chatbot/core/utils/constants/storage_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeListener with ChangeNotifier, DiagnosticableTreeMixin{

  ThemeMode themeMode = LocalStorage().getFromBox(key: StorageKeys.appTheme)==true?ThemeMode.dark:ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme({required bool isOn}) {
    LocalStorage().putInBox(key: StorageKeys.appTheme, value: isOn);
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // get appColor => themeMode == ThemeMode.dark?AppColors.DARK:AppColors.LIGHT;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('isDarkMode :', isDarkMode.toString()));
  }
}

// navigatorKey.!.read<LocalListener>().setLanguage(selectionLanguage);