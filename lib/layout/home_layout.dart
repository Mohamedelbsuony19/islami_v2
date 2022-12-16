import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../modules/hadeth/hadeth_screen.dart';
import '../modules/quraan/quran_screen.dart';
import '../modules/radio/radio_screen.dart';
import '../modules/sebha/sebha_screen.dart';

class homeLayout extends StatefulWidget {
  static const String routrName = 'home';

  @override
  State<homeLayout> createState() => _homeLayoutState();
}

class _homeLayoutState extends State<homeLayout> {
  late int curIndex = 0;
  late List screens = [
    quraanScreen(),
    hadethScreen(),
    sebhaScreen(),
    radioScreen()
  ];

// assetes/images/bg_light.png
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assetes/images/bg_light.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: screens[curIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: curIndex,
              onTap: (index) {
                curIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assetes/images/ic_qraan.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assetes/images/ic_hadeth.png')),
                    label: AppLocalizations.of(context)!.ahadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assetes/images/ic_sebha.png')),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assetes/images/ic_radio.png'),
                    ),
                    label: AppLocalizations.of(context)!.radio),
              ],
            ),
          ),
        )
      ],
    );
  }
}
