import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_cupertino_music/sample3.dart';
import 'dart:math' as math;

import './custom_flexible_space_bar.dart';

// import 'mine/sample3.dart';
// import 'mine/sample2.dart';
// import 'mine/sample1.dart';


// const Icon icon_home = Icon
// (
//   const IconData
//   (
//     0xF38F,
//     fontFamily: CupertinoIcons.iconFont,
//     fontPackage: CupertinoIcons.iconFontPackage
//   )
// );

// const Icon icon_browse = Icon(CupertinoIcons.double_music_note);
// const Icon icon_for_you = Icon(CupertinoIcons.heart_solid);
// const Icon icon_search = Icon
// (
//   const IconData
//   (
//     0XF4A4,
//     fontFamily: CupertinoIcons.iconFont,
//     fontPackage: CupertinoIcons.iconFontPackage
//   )
// );
// const Icon icon_radio = Icon
// (
//   const IconData
//   (
//     0xF2AC,
//     fontFamily: CupertinoIcons.iconFont,
//     fontPackage: CupertinoIcons.iconFontPackage
//   )
// );

const Icon icon_test = Icon(Icons.beach_access);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home:Sample3());

    return CupertinoApp (
      home: HomeScreen(),
      theme: CupertinoThemeData (
        textTheme: CupertinoTextThemeData (
          // navLargeTitleTextStyle: TextStyle (
          //   fontWeight: FontWeight.bold,
          //   fontSize: 35.0,
          //   // fontSize: 50.0,
          //   color: CupertinoColors.white,
          // ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold (
        tabBar: CupertinoTabBar (
          items: [
              BottomNavigationBarItem (
                icon: Icon(Icons.library_music),
                title: Text('Library'),
              ),
              BottomNavigationBarItem (
                icon: Icon(Icons.explore),
                title: Text('Explore'),
              ),
              BottomNavigationBarItem (
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
            ],
        ),
        tabBuilder: (context, index) {
          var tabs = <Widget>[LibraryTab(), ExploreTab(), SearchTab()];

          return CupertinoTabView (
            builder: (context) {
              return tabs[index];
              // return CupertinoPageScaffold (
              //   child: tabs[index],
              // );
            }
          );
        },
      );
  }
}

// https://developpaper.com/create-interesting-scrolling-effects-in-flutter-sliver-series/
// https://github.com/diegoveloper/flutter_stretchy_header
// https://medium.com/flutter-community/flutter-sliverappbar-with-stretchy-header-9ca04f316ff0

// https://morioh.com/p/3f7e09cf96ba

class LibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold (
      child: CustomScrollView (
        physics: const BouncingScrollPhysics(),
        slivers: <Widget> [
          SliverAppBar (
            expandedHeight: MediaQuery.of(context).size.height / 2,
            stretch: true,
            pinned: true,
            backgroundColor: Colors.black,
            // actions: [
            //   Icon(Icons.home),
            // ],
            // title: Text('some title', style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
            flexibleSpace: CustomFlexibleSpaceBar (
              // title: Text (
              //   'Aquilo',
              //   style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
              // ),
              // currentExtent: 0.5,
              title: FittedBox (
                fit: BoxFit.fitWidth,
                child: Text (
                  'Aquilo'
                  // 'This is really long and might overflow oh dear big f',
                  // style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                ),
              ),
              centerTitle: true,
              // titlePadding: EdgeInsets.all(1),
              // titlePadding: EdgeInsets.only(left: 40.0),
              // titlePadding: EdgeInsets.symmetric(vertical: 5.0),
              // titlePadding: Padding(padding: EdgeInsetsGeometry(collapsedSize: 10.0)),
              // titlePadding: EdgeInsetsGeometry(collapsedSize: 10.0),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network (
                'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining (
            child: Text('content'),
          ),
        ]
      )
    );
  }
}

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestingNew();
  }
}

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestingNew2();
  }
}

class _ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold (
      child: CustomScrollView (
        physics: const BouncingScrollPhysics(),
        slivers: <Widget> [
          SliverAppBar (
            expandedHeight: 100.0,
            stretch: true,
            pinned: true,
            backgroundColor: Colors.white,
            // actions: [
            //   Icon(Icons.home),
            // ],
            // title: Text('some title', style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
            flexibleSpace: FlexibleSpaceBar (
              // title: Text (
              //   'Aquilo',
              //   style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
              // ),
              // currentExtent: 0.5,
              title: FittedBox (
                fit: BoxFit.fitWidth,
                child: Text (
                  'Explore',
                  // 'This is really long and might overflow oh dear big f',
                  // style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                  style: TextStyle (
                    color: Colors.black,
                  ),
                ),
              ),
              centerTitle: true,
              // titlePadding: EdgeInsets.all(1),
              // titlePadding: EdgeInsets.only(left: 40.0),
              // titlePadding: EdgeInsets.symmetric(vertical: 5.0),
              // titlePadding: Padding(padding: EdgeInsetsGeometry(collapsedSize: 10.0)),
              // titlePadding: EdgeInsetsGeometry(collapsedSize: 10.0),
              stretchModes: [
                StretchMode.zoomBackground,
                // StretchMode.fadeTitle,
              ],
              // background: Image.network (
              //   'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SliverFillRemaining (
            child: Text('content'),
          ),
        ]
      )
    );
  }
}

class _SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold (
      child: CustomScrollView (
        physics: const BouncingScrollPhysics(),
        slivers: <Widget> [
          SliverAppBar (
            expandedHeight: 100.0,
            stretch: true,
            pinned: true,
            backgroundColor: Colors.white,
            // actions: [
            //   Icon(Icons.home),
            // ],
            // title: Text('some title', style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
            flexibleSpace: FlexibleSpaceBar (
              // title: Text (
              //   'Aquilo',
              //   style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
              // ),
              // currentExtent: 0.5,
              title: FittedBox (
                fit: BoxFit.fitWidth,
                child: Text (
                  'Explore',
                  // 'This is really long and might overflow oh dear big f',
                  // style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                  style: TextStyle (
                    color: Colors.black,
                  ),
                ),
              ),
              centerTitle: true,
              // titlePadding: EdgeInsets.all(1),
              // titlePadding: EdgeInsets.only(left: 40.0),
              // titlePadding: EdgeInsets.symmetric(vertical: 5.0),
              // titlePadding: Padding(padding: EdgeInsetsGeometry(collapsedSize: 10.0)),
              // titlePadding: EdgeInsetsGeometry(collapsedSize: 10.0),
              stretchModes: [
                StretchMode.zoomBackground,
                // StretchMode.fadeTitle,
              ],
              // background: Image.network (
              //   'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SliverFillRemaining (
            child: Text('content'),
          ),
        ]
      )
    );
  }
}

class TestingNew extends StatefulWidget {
  @override
  TestingNewState createState() => TestingNewState();
}

class TestingNewState extends State<TestingNew> {
  ScrollController _scrollController;

  // bool lastStatus = true;
  double fadeTriggerOffset = 50.0; // px
  double lastFadeOpacity = 1.0;

  _scrollListener() {
    if (currentFadeOpacity != lastFadeOpacity) {
      setState(() {
        lastFadeOpacity = currentFadeOpacity;
        // print("currentFadeOpacity = ${currentFadeOpacity}");
      });
    }
  }

  double get currentFadeOpacity {
    // print("_scrollController.hasClients = ${_scrollController.hasClients}");
    if (! _scrollController.hasClients)
    {
      // print("_scrollController.hasClients = ${_scrollController.hasClients}");
      return lastFadeOpacity;
    }
    double scroll_offset = _scrollController.offset;
    double sliver_height = MediaQuery.of(context).size.height / 2;
    double bar_height = kToolbarHeight;
    double trigger_offset = fadeTriggerOffset;

    // print("_scrollController.hasClients = ${_scrollController.hasClients}");
    // print("scroll_offset = ${_scrollController.offset}");
    // print("sliver_height = ${MediaQuery.of(context).size.height / 2}");
    // print("bar_height = ${kToolbarHeight}");
    // print("trigger_offset = ${fadeTriggerOffset}");

    // print("calc: ${scroll_offset - sliver_height}");

    double depth = (scroll_offset - sliver_height + bar_height + trigger_offset) / trigger_offset;

    if (depth <= 0) {
      return 1;
    }
    else if (depth >= 1) {
      return 0;
    }
    
    return 1 - depth;
  }

  // bool get isShrink {
  //   // print("_scrollController.hasClients = ${_scrollController.hasClients}");
  //   // print("_scrollController.offset = ${_scrollController.offset}");
  //   // print("MediaQuery.of(context).size.height / 2 = ${MediaQuery.of(context).size.height / 2}");
  //   // print("kToolbarHeight = ${kToolbarHeight}");

  //   return _scrollController.hasClients &&
  //       _scrollController.offset > (MediaQuery.of(context).size.height / 2 - kToolbarHeight);
  // }

  // double get flexibleSpaceBarHeight {
  //   return MediaQuery.of(context).size.height / 2 - kToolbarHeight; 
  // }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return NestedScrollView(
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget> [
        SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2,
            // floating: false,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 1.0,
            title: Opacity (
              // opacity: isShrink ? 1.0 : 0.0,
              opacity: 1 - currentFadeOpacity,
              child: Text (
                'Aquilo',
                style: TextStyle (
                  color: Colors.black,
                )
              ),
            ),
            flexibleSpace: CustomFlexibleSpaceBar(
                // centerTitle: true,
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                titlePadding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                title: Opacity (
                  // opacity: isShrink ? 0.0 : 1.0,
                  opacity: currentFadeOpacity,
                  child: Text (
                    "Aquilo",
                    style: TextStyle (
                      color: Colors.white,
                    ),
                  ),
                ),
                // ),
                background: Image.network(
                  'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
                  fit: BoxFit.cover,
                )),
          ),
          SliverFillRemaining (
            child: Text('content'),
          ),
        ],
      // },
      // body: Center(
      //   child: Text("hello world"),
      // ),
    );
  }
  }

  //////////////////////


class TestingNew2 extends StatefulWidget {
  @override
  TestingNew2State createState() => TestingNew2State();
}

class TestingNew2State extends State<TestingNew2> {
  ScrollController _scrollController;

  // bool lastStatus = true;
  double fadeTriggerOffset = 50.0; // px
  double lastFadeOpacity = 1.0;

  _scrollListener() {
    if (currentFadeOpacity != lastFadeOpacity) {
      setState(() {
        lastFadeOpacity = currentFadeOpacity;
        // print("currentFadeOpacity = ${currentFadeOpacity}");
      });
    }
  }

  double get currentFadeOpacity {
    // print("_scrollController.hasClients = ${_scrollController.hasClients}");
    if (! _scrollController.hasClients)
    {
      // print("_scrollController.hasClients = ${_scrollController.hasClients}");
      return lastFadeOpacity;
    }
    double scroll_offset = _scrollController.offset;
    double sliver_height = 150.0;
    double bar_height = kToolbarHeight;
    double trigger_offset = fadeTriggerOffset;

    // print("_scrollController.hasClients = ${_scrollController.hasClients}");
    // print("scroll_offset = ${_scrollController.offset}");
    // print("sliver_height = ${MediaQuery.of(context).size.height / 2}");
    // print("bar_height = ${kToolbarHeight}");
    // print("trigger_offset = ${fadeTriggerOffset}");

    // print("calc: ${scroll_offset - sliver_height}");

    double depth = (scroll_offset - sliver_height + bar_height + trigger_offset) / trigger_offset;

    if (depth <= 0) {
      return 1;
    }
    else if (depth >= 1) {
      return 0;
    }
    
    return 1 - depth;
  }

  // bool get isShrink {
  //   // print("_scrollController.hasClients = ${_scrollController.hasClients}");
  //   // print("_scrollController.offset = ${_scrollController.offset}");
  //   // print("MediaQuery.of(context).size.height / 2 = ${MediaQuery.of(context).size.height / 2}");
  //   // print("kToolbarHeight = ${kToolbarHeight}");

  //   return _scrollController.hasClients &&
  //       _scrollController.offset > (MediaQuery.of(context).size.height / 2 - kToolbarHeight);
  // }

  // double get flexibleSpaceBarHeight {
  //   return MediaQuery.of(context).size.height / 2 - kToolbarHeight; 
  // }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return NestedScrollView(
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget> [
        SliverAppBar(
            expandedHeight: 150.0,
            // floating: false,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 1.0,
            // title: Text (
            //   'Aquilo',
            //   style: TextStyle (
            //     color: Colors.black,
            //   )
            // ),
            title: Opacity (
              opacity: 1 - currentFadeOpacity,
              child: Text (
                'Aquilo',
                style: TextStyle (
                  color: Colors.black,
                )
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                // centerTitle: true,
                stretchModes: [
                  // StretchMode.zoomBackground,
                  // StretchMode.fadeTitle,
                ],
                titlePadding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                // title: Text (
                //   'Aquilo',
                //   style: TextStyle (
                //     color: Colors.black,
                //     fontSize: 30.0,
                //   )
                // ),
                title: Opacity (
                  opacity: currentFadeOpacity,
                  child: Text (
                    "Aquilo",
                    style: TextStyle (
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                // ),
                // background: Image.network(
                //   'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
                //   fit: BoxFit.cover,
                // )),
            ),
          ),
          SliverFillRemaining (
            child: Text('content'),
          ),
        ],
      // },
      // body: Center(
      //   child: Text("hello world"),
      // ),
    );
  }
  }