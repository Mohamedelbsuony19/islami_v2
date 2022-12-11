import 'package:flutter/material.dart';
import 'package:islami_app/layout/home_layout.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {homeLayout.routrName: (buildContext) => homeLayout()},
      initialRoute: homeLayout.routrName,
    );
  }
}
