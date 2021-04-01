import 'package:flutter/material.dart';
import 'package:memoristan/core/providers/themedata.dart';
import 'package:provider/provider.dart';
import 'game_s.dart';

final isSelected = <bool>[true, false, false, false, false, false];

class HomePage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    int cards, column;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "MEMORİSTAN",
              style: TextStyle(
                color: Colors.deepOrange,
                fontFamily: "IndieFlower",
                fontSize: 25.0,
                letterSpacing: 3.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  Provider.of<MyThemeData>(
                    context,
                    listen: false,
                  ).updateTheme();
                },
                icon: Provider.of<MyThemeData>(context).isdarkmodeon == false
                    ? Icon(Icons.wb_sunny_rounded)
                    : Icon(Icons.nights_stay_rounded),
              ),
            ]),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:40.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(45),
                        onTap: () {
                          if (isSelected[0]) {
                            cards = 12;
                            column = 3;
                          } else if (isSelected[1]) {
                            cards = 16;
                            column = 4;
                          } else if (isSelected[2]) {
                            cards = 18;
                            column = 3;
                          } else if (isSelected[3]) {
                            cards = 20;
                            column = 4;
                          } else if (isSelected[4]) {
                            cards = 24;
                            column = 4;
                          } else if (isSelected[5]) {
                            cards = 32;
                            column = 4;
                          } else {
                            cards = 12;
                            column = 3;
                          }
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => GamePage(
                                cardNumbers: cards,
                                columnNumber: column,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          width: 75,
                          height: 75,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 55,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Togglebutton(),
            ],
          ),
        ),
      ),
    );
  }
}

class Togglebutton extends StatefulWidget {
  @override
  _TogglebuttonState createState() => _TogglebuttonState();
}

class _TogglebuttonState extends State<Togglebutton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      textStyle: TextStyle(fontSize: 17.0),
      borderWidth: 2.0,
      color: Colors.deepOrange.withOpacity(0.70),
      selectedColor: Colors.deepOrange[700],
      selectedBorderColor: Colors.deepOrange[700],
      fillColor: Colors.deepOrange.withOpacity(0.08),
      borderRadius: BorderRadius.circular(4.0),
      constraints: BoxConstraints(minHeight: 36.0),
      isSelected: isSelected,
      onPressed: (index) {
        setState(() {
          for (int indexBtn = 0; indexBtn < isSelected.length; indexBtn++) {
            if (indexBtn == index) {
              isSelected[indexBtn] = true;
            } else {
              isSelected[indexBtn] = false;
            }
          }
        });
      },
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '4 x 3',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '4 x 4',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '6 x 3',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '5 x 4',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '6 x 4',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '8 x 4',
          ),
        ),
      ],
    );
  }
}
