import 'package:flutter/material.dart';
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
