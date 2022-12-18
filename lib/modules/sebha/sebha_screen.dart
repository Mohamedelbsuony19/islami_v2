import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../shared/app_provider/app_prvider.dart';

class sebhaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assetes/images/head of seb7a.png'),
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.09),
                  child: InkWell(
                      onTap: () {
                        pro.onClickTasbeh();
                      },
                      child: Transform.rotate(
                          angle: pro.angle,
                          child: Image.asset(
                              'assetes/images/body_of_sebha.png')))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.adadTasbeh,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              '${pro.counter}',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xFFB7935F),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              pro.azkar[pro.index],
              style: pro.islight
                  ? Theme.of(context).textTheme.subtitle1
                  : Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
