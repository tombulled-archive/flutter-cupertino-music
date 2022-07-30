import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/home.dart';

// import 'tabs/search0.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CupertinoThemeData theme_dark = CupertinoThemeData (
  barBackgroundColor: Colors.grey[900],
  brightness: Brightness.dark,
  textTheme: CupertinoTextThemeData (
    actionTextStyle: TextStyle (
      // color: CupertinoColors.systemPink,
      // color: CupertinoColors.systemPink,
      // color: Color(0xff2f56),
      // color: Color(0xFFFF375F),
      color: Color(0xFFEE3D60),
      // color: Colors.redAccent,
    ),

    // navLargeTitleTextStyle: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith (
    //   fontSize: 10.0,
    // ),

  navLargeTitleTextStyle: TextStyle(
  inherit: false,
  // fontFamily: '.SF Pro Display',
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.41,
  // color: CupertinoColors.label,
  color: Colors.white,
),



    // navLargeTitleTextStyle: TextStyle (
    //   fontSize: 1.0,
    //   fontWeight: FontWeight.bold,
    // )
  ),
);

CupertinoThemeData theme_light = CupertinoThemeData (
  barBackgroundColor: Colors.grey[200],
  brightness: Brightness.light,
  textTheme: CupertinoTextThemeData (
    actionTextStyle: TextStyle (
      color: CupertinoColors.systemPink,
    ),

    navLargeTitleTextStyle: TextStyle(
      inherit: false,
      fontFamily: '.SF Pro Display',
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.41,
      color: CupertinoColors.label,
      // color: Colors.red,
    ),
  ),
);

// CupertinoThemeData theme = theme_light;
CupertinoThemeData theme = theme_dark;

    return CupertinoApp (
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: theme,
      localizationsDelegates: [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
      ],
      // routes: {
      //   // '/': (_) => SearchTab(),
      //   'deeper': (_) => SearchTab(),
      // },
      // onGenerateRoute: (RouteSettings settings) {
      //   switch (settings.name) {
      //     case '/':
      //       return CupertinoPageRoute (
      //         builder: (_) => HomeScreen(),
      //         settings: settings,
      //       );
      //     case '':
      //       return CupertinoPageRoute (
      //         builder: (_) => HomeScreen(),
      //         settings: settings,
      //       );
      //   }
      // },
    );
  }
}