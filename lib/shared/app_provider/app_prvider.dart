import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/shared/style/myTheme.dart';

import '../../modules/hadeth/hadeth_screen.dart';
import '../../modules/quraan/quran_screen.dart';
import '../../modules/radio/radio_screen.dart';
import '../../modules/sebha/sebha_screen.dart';
import '../../modules/settings/settings_screen.dart';

class AppProvider extends ChangeNotifier {
  late String appLang = 'en';
  late String language = 'English';
  late String homeThemeLight = 'Light';
  late String homeThemeDark = 'Dark';
  late ThemeData light = MyTheme.lightTheme;
  late bool isSelectEnglish = true;
  late bool islight = true;

  late int curIndex = 0;
  late List screens = [
    quraanScreen(),
    hadethScreen(),
    sebhaScreen(),
    radioScreen(),
    settingScreen()
  ];

  List<String> verses = [];

  late int counter = 0;
  late List<String> azkar = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
    'الله اكبر',
    'لاحول ولا قوه ال بالله'
  ];
  late int index = 0;
  late double angle = 0;

  int? indexModel;
  String? nameModel;

  void changeLang(String lan) {
    appLang = lan;
    isSelectEnglish = !isSelectEnglish;
    notifyListeners();
  }

  void changeTheme(ThemeData myTheme) {
    light = myTheme;
    islight = !islight;
    notifyListeners();
  }

  void changeScreen(int num) {
    curIndex = num;
    notifyListeners();
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assetes/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    notifyListeners();
  }

  void onClickTasbeh() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (counter % 165 == 0) {
      index = 0;
    }
    angle += 20;
    notifyListeners();
  }
}
