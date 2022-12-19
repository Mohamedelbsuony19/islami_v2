import 'package:flutter/material.dart';
import 'package:islami_app/models/radio/Radios.dart';

class radioItem extends StatelessWidget {
  Radios item;
  Function play;
  Function puse;

  radioItem(this.item, this.play, this.puse);

//  play()async{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            '${item.name}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    play(item.url);
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: Color(0xFFB7935F),
                    size: 45,
                  )),
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    puse();
                  },
                  icon: Icon(
                    Icons.pause,
                    color: Color(0xFFB7935F),
                    size: 45,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
