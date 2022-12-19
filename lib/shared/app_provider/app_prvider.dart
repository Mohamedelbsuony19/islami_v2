import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/shared/style/myTheme.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../models/radio/Radio_response.dart';
import '../../modules/hadeth/hadeth_screen.dart';
import '../../modules/quraan/quran_screen.dart';
import '../../modules/radio/radio_screen.dart';
import '../../modules/sebha/sebha_screen.dart';
import '../../modules/settings/settings_screen.dart';
import 'package:http/http.dart' as http;

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

  late Future<RadioResponse> respnse = fetchRadio();

  Future<RadioResponse> fetchRadio() async {
    final response = await http
        .get(Uri.parse('https://www.mp3quran.net/api/v3/radios?language=ar'));

    if (response.statusCode == 200) {
      return RadioResponse.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load radio');
    }
  }

  late AudioPlayer audioPlayer = AudioPlayer();

  play(String url) async {
    int resualt = await audioPlayer.play(url);
  }

  puse() async {
    await audioPlayer.pause();
  }
}
