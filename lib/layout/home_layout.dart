import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../shared/app_provider/app_prvider.dart';

class homeLayout extends StatelessWidget {
  static const String routrName = 'home';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Stack(
      children: [
        Image.asset(
          provider.islight
              ? 'assetes/images/bg_light.png'
              : "assetes/images/bg_dark.png",
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
          body: provider.screens[provider.curIndex], //screens[curIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: provider.curIndex,
              onTap: (index) {
                provider.changeScreen(index);
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.setting),
              ],
            ),
          ),
        )
      ],
    );
  }
}
