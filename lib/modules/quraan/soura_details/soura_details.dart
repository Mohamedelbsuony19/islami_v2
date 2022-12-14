import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/shared/componente/componetes.dart';
import 'package:provider/provider.dart';

import '../../../models/quran/model_quran.dart';
import '../../../shared/app_provider/app_prvider.dart';

class souraDetails extends StatefulWidget {
  static const String route_Name = 'souaDetalis';

  @override
  State<souraDetails> createState() => _souraDetailsState();
}

class _souraDetailsState extends State<souraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var arg = ModalRoute.of(context)?.settings.arguments as argData;
    if (verses.isEmpty) loadFile(arg.index);
    return Stack(children: [
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
            arg.name,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: verses.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 50),
              color: Theme.of(context).primaryColor,
            );
          },
          itemBuilder: (context, index) {
            return itemSouraOrVarses(
                nameSoura: verses[index], context: context);
          },
          itemCount: verses.length,
        ),
      )
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assetes/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    print(lines);
    verses = lines;
    setState(() {});
  }
}
