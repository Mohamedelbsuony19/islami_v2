import 'package:flutter/material.dart';
import 'package:islami_app/modules/settings/theme_btn_sheet.dart';
import 'package:islami_app/shared/app_provider/app_prvider.dart';
import 'package:provider/provider.dart';

import 'language_btn-sheet.dart';

class settingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            pro.isSelectEnglish ? 'Language' : 'اللغة',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: 20, color: Color(0xFFB7935F)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () {
              showLangBtnSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: pro.islight ? Colors.white : Color(0xFFB7935F),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Text(
                pro.isSelectEnglish ? pro.language : 'العربية',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 18),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            pro.isSelectEnglish ? 'Theme' : 'الثيمات',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: 20, color: Color(0xFFB7935F)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () {
              showthemeBtnSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: pro.islight ? Colors.white : Color(0xFFB7935F),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Text(
                pro.islight ? 'Light' : 'Dark',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showLangBtnSheet(BuildContext contex) {
    showModalBottomSheet(
        context: contex,
        builder: (buildContext) {
          return langBtnSheet();
        });
  }

  void showthemeBtnSheet(BuildContext contex) {
    showModalBottomSheet(
        context: contex,
        builder: (buildContext) {
          return themeBtnSheet();
        });
  }
}
