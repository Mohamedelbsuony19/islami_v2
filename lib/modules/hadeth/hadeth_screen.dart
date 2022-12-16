import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/hadeth/models_hadeth.dart';
import '../../shared/componente/componetes.dart';

class hadethScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadAhadeth();
    return Container(
      child: Column(
        children: [
          Image.asset('assetes/images/head_hadeth.png'),
          Divider(color: Theme.of(context).primaryColor, thickness: 3),
          Text(
            'Ahadeth',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 3,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      itemHadeth(HModel: myAhadeth[index], context: context),
                  separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).primaryColor, thickness: 1),
                  itemCount: myAhadeth.length)),
        ],
      ),
    );
  }

  late List<hadethModel> myAhadeth = [];

  Future loadAhadeth() async {
    String content = await rootBundle.loadString('assetes/files/ahadeth .txt');
    List<String> ahadeth = content.trim().split('#\r\n');
    for (int i = 0; i < ahadeth.length; i++) {
      String hadeth = ahadeth[i];
      print(hadeth);
      print('----------------------');
      List<String> lines = hadeth.split('\n');
      String title = lines[0];
      lines.removeAt(0);
      hadethModel myHadeth = hadethModel(title, lines);
      myAhadeth.add(myHadeth);
    }
  }
}
