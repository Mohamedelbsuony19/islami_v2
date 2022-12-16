import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/layout/home_layout.dart';
import 'package:islami_app/modules/hadeth/hadeth_details.dart';
import 'package:islami_app/modules/quraan/soura_details/soura_details.dart';
import 'package:islami_app/shared/style/myTheme.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      routes: {
        homeLayout.routrName: (buildContext) => homeLayout(),
        souraDetails.route_Name: (buildContext) => souraDetails(),
        hadithDetails.routeName: (buildContext) => hadithDetails()
      },
      initialRoute: homeLayout.routrName,
      theme: MyTheme.lightTheme,
    );
  }
}
