import 'package:flutter/material.dart';
import 'package:memoristan/ui/screens/game_s.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class CustomDialog extends StatelessWidget {
  final time, flipcount, point, cards, column;

  const CustomDialog(
      {Key key, this.time, this.flipcount, this.point, this.cards, this.column})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 20,
            top: 25,
            right: 20,
            bottom: 20,
          ),
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).score + " $point",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).time + " : $time",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    AppLocalizations.of(context).flip + " : $flipcount",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          "tohome",
                          (r) => false,
                        );
                      },
                      child: Icon(
                        Icons.home_rounded,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => GamePage(
                              cardNumbers: cards,
                              columnNumber: column,
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.refresh_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
