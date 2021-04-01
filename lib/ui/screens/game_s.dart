import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memoristan/ui/widgets/custom_dialog.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class GamePage extends StatefulWidget {
  final int cardNumbers, columnNumber;

  const GamePage({Key key, this.cardNumbers, this.columnNumber})
      : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  List<bool> cardFlips = [];
  List<String> data = [];
  int previousIndex = -1;
  bool flip = false;
  int time = 0;
  int flipcount = 0;
  int point;
  Timer timer;
  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.mounted) {
        setState(() {
          time++;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.cardNumbers; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(true);
    }
    for (var i = 0; i < widget.cardNumbers / 2; i++) {
      data.add(i.toString());
    }
    for (var i = 0; i < widget.cardNumbers / 2; i++) {
      data.add(i.toString());
    }
    data.shuffle();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                AppLocalizations.of(context).time + " : $time",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                AppLocalizations.of(context).flip + " : $flipcount",
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.columnNumber,
              ),
              itemBuilder: (context, index) => FlipCard(
                key: cardStateKeys[index],
                direction: FlipDirection.HORIZONTAL,
                onFlip: () {
                  if (!flip) {
                    flip = true;
                    previousIndex = index;
                  } else {
                    flip = false;
                    if (previousIndex != index) {
                      if (data[previousIndex] != data[index]) {
                        cardStateKeys[previousIndex].currentState.toggleCard();
                        previousIndex = index;
                        setState(() {
                          flipcount++;
                        });
                      } else {
                        cardFlips[previousIndex] = false;
                        cardFlips[index] = false;

                        if (cardFlips.every((t) => t == false)) {
                          timer.cancel();
                          point = calculatepoint(
                              time: time,
                              flip: flipcount,
                              level: widget.cardNumbers);
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog(
                                cards: widget.cardNumbers,
                                column: widget.columnNumber,
                                time: time,
                                flipcount: flipcount,
                                point: point,
                              );
                            },
                          );
                        }
                      }
                    }
                  }
                },
                flipOnTouch: cardFlips[index],
                front: Container(
                  margin: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.orange,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/card.jpg"),
                    ),
                  ),
                ),
                back: Container(
                  margin: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.yellowAccent[700],
                  ),
                  child: Center(
                    child: Text(
                      "${data[index]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                          fontFamily: "IndieFlower"),
                    ),
                  ),
                ),
              ),
              itemCount: widget.cardNumbers,
            ),
          ),
        ),
      ),
    );
  }

calculatepoint( {int flip, int level,int time}){
  int timebonus;
  int flipbonus;
  if(level == 12){
    timebonus = (35 - time) * 10;
    flipbonus = (20 -flip) *10;
  }
  else if(level==16){
    timebonus = (35 - time) * 10;
    flipbonus = (25 -flip) * 10;
  }
  else if(level==18){
    timebonus = (55 - time) * 10;
    flipbonus = (30 -flip) * 10;
  }
  else if(level==20){
    timebonus = (70 - time) * 10;
    flipbonus = (35 -flip) * 10;
  }
  else if(level==24){
    timebonus = (80 - time) * 10;
    flipbonus = (45 -flip) * 10;
  }
  else{
    timebonus = (90 - time) * 10;
    flipbonus = (55 -flip) * 10;
  }

  if(timebonus<0){
    timebonus=0;
  }
  if(flipbonus<0){
    flipbonus=0;
  }

  return flipbonus + timebonus;
}
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
