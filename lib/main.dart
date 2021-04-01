import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:memoristan/ui/screens/game_s.dart';
import 'package:memoristan/ui/widgets/theme_data.dart';
import 'package:provider/provider.dart';
import 'core/l10n/l10n.dart';
import 'core/providers/themedata.dart';
import 'ui/screens/home_s.dart';
import 'ui/widgets/glow_disable.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyThemeData().createShared();
  runApp(
    ChangeNotifierProvider<MyThemeData>(
      create: (context) => MyThemeData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MyThemeData>(context, listen: false).loadFromShared();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightheme,
        darkTheme: AppTheme.darktheme,
        themeMode: Provider.of<MyThemeData>(context).isdarkmodeon == false
            ? ThemeMode.light
            : ThemeMode.dark,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: L10n.lang,
        routes: {
          "tohome": (context) => HomePage(),
          "togame": (context) => GamePage(),
        },
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        initialRoute:"tohome",
      );
    
  }
}
