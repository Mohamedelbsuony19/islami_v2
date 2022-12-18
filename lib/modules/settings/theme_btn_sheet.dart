import 'package:flutter/material.dart';
import 'package:islami_app/shared/app_provider/app_prvider.dart';
import 'package:islami_app/shared/style/myTheme.dart';
import 'package:provider/provider.dart';

class themeBtnSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppProvider>(context);
    return Container(
      color: pro.islight ? Colors.white : Colors.black,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                pro.changeTheme(MyTheme.lightTheme);
              },
              child: getLangRow(pro.isSelectEnglish ? 'Light' : 'فاتح',
                  pro.islight, context)),
          InkWell(
              onTap: () {
                pro.changeTheme(MyTheme.Darkheme);
              },
              child: getLangRow(pro.isSelectEnglish ? 'Dark' : 'داكن',
                  pro.islight ? false : true, context)),
        ],
      ),
    );
  }

  Widget getLangRow(String text, bool isSelcted, context) {
    var pro = Provider.of<AppProvider>(context);
    if (isSelcted) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: pro.islight ? Color(0xFFB7935F) : Colors.white),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.done_outline,
                color: pro.islight ? Color(0xFFB7935F) : Colors.white,
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
      );
    }
  }
}
