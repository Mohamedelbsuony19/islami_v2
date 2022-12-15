import 'package:flutter/material.dart';

class sebhaScreen extends StatefulWidget {
  @override
  State<sebhaScreen> createState() => _sebhaScreenState();
}

class _sebhaScreenState extends State<sebhaScreen> {
  late int counter = 0;
  late List<String> azkar = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
    'الله اكبر',
    'لاحول ولا قوه ال بالله'
  ];
  late int index = 0;
  late double angle = 0;

  @override
  Widget build(BuildContext context) {
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
                        onClickTasbeh();
                      },
                      child: Transform.rotate(
                          angle: angle,
                          child: Image.asset(
                              'assetes/images/body_of_sebha.png')))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'عدد التسبيحات',
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
              '$counter',
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
              azkar[index],
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )
        ],
      ),
    );
  }

  void onClickTasbeh() {
    setState(() {
      counter++;
      if (counter % 33 == 0) {
        index++;
      }
      if (counter % 165 == 0) {
        index = 0;
      }
      angle += 20;
    });
  }
}
