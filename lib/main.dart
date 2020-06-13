
import 'ui/home/home_main_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'c.dart';
import 'depositories/local/db_helper.dart';
import 'global.dart';
import 'model/db/user_model.dart';

void main() async {

  await DBHelper.init();
  final user = await DBHelper.fetchUser();

  runApp(BotToastInit(
    child: MultiProvider(providers: [
      ChangeNotifierProvider<UserModel>.value(value: user)
    ],
    child: MyApp(),),
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豹小贝',
      navigatorKey: Global.navigatorState,
      navigatorObservers: [BotToastNavigatorObserver()],
      localizationsDelegates: [
        RefreshLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('zh'),
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        //print("change language");
        return locale;
      },
      theme: ThemeData(
          primaryColor: CCColor.primaryColor,
          accentColor: CCColor.accentColor,
          backgroundColor: CCColor.backgroundColor,
          primaryTextTheme: TextTheme(
              bodyText1: TextStyle(color: CCColor.textColorPrimary),
              subtitle1: TextStyle(color: CCColor.textColorSecondary)),
          primarySwatch: Colors.red,
          pageTransitionsTheme: PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder> {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
                TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
                TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
              }
          )
      ),
      home: HomeMainPage(key: Global.homeMainKey,),
    );
  }
}

