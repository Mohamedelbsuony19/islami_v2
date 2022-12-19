import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/radio/Radio_response.dart';
import '../../models/radio/radio_item.dart';
import '../../shared/app_provider/app_prvider.dart';

class radioScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppProvider>(context);

    return FutureBuilder<RadioResponse>(
        future: pro.respnse,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assetes/images/radio.png',
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: PageScrollPhysics(),
                        itemCount: snapShot.data!.radios!.length,
                        itemBuilder: (context, index) {
                          return radioItem(
                              snapShot.data!.radios![index],
                              //  =item in radio item
                              pro.play,
                              pro.puse);
                        }))
              ],
            );
          } else if (snapShot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      pro.respnse = pro.fetchRadio();
                    },
                    icon: Icon(
                      Icons.refresh,
                      size: 40,
                      color: Color(0xFFB7935F),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Check Your Intrnet',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
