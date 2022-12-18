import 'package:flutter/material.dart';
import 'package:islami_app/shared/app_provider/app_prvider.dart';
import 'package:provider/provider.dart';

import '../../models/hadeth/models_hadeth.dart';
import '../../shared/componente/componetes.dart';

class hadithDetails extends StatelessWidget {
  static const String routeName = 'hadethDeta';

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppProvider>(context);
    var arg = ModalRoute.of(context)?.settings.arguments as hadethModel;
    return Stack(
      children: [
        Image.asset(
          pro.islight
              ? 'assetes/images/bg_light.png'
              : "assetes/images/bg_dark.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              arg.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: arg.content.length == 0
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 0.2,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          color: Theme.of(context).primaryColor,
                        );
                      },
                      itemBuilder: (context, index) {
                        return itemSouraOrVarses(
                            nameSoura: arg.content[index], context: context);
                      },
                      itemCount: arg.content.length,
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
