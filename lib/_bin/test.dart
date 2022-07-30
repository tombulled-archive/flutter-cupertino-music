import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

class TestingNew extends StatefulWidget {
  @override
  TestingNewState createState() => TestingNewState();
}

class TestingNewState extends State<TestingNew> {
  ScrollController _scrollController;

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
    // double sliver_height = MediaQuery.of(context).size.width;
    // double sliver_height = (MediaQuery.of(context).size.height / 3) * 2;
    double sliver_height = math.min (
              (2/3) * MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.width,
            );
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
    return CustomScrollView (
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget> [
        SliverAppBar (
          expandedHeight: math.min (
            (2 / 3) * MediaQuery.of(context).size.height,
            MediaQuery.of(context).size.width,
          ),
          floating: false,
          pinned: true,
          stretch: true,
          backgroundColor: new Color.fromRGBO(0, 0, 0, 0),
          centerTitle: true,
          elevation: 0.0,
          bottom: PreferredSize (
            preferredSize: Size.fromHeight(0.2),
            child: Container (
              height: 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration (
                color: Colors.grey[800],
              ),
            ),
          ),
          title: Opacity (
            opacity: 1 - currentFadeOpacity,
            child: Text (
              'Aquilo',
              style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            ),
          ),
          flexibleSpace: FlexibleSpaceBar (
            stretchModes: [
              StretchMode.zoomBackground,
            ],
            titlePadding: EdgeInsets.all(0.0),
            title: Stack (
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget> [
                Opacity (
                  opacity: currentFadeOpacity,
                  child: Container (
                    height: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration (
                      gradient: LinearGradient (
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.black54,
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned (
                  bottom: 10.0,
                  left: 10.0,
                  child: Opacity (
                    opacity: currentFadeOpacity,
                    child: Text (
                      'Aquilo',
                      // style: TextStyle (
                      //   fontSize: 30.0,
                      // ),
                      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith (
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Opacity (
                  opacity: 1 - currentFadeOpacity,
                  child: Container (
                    child: ClipRect (
                      child: BackdropFilter (
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container (
                          color: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.8),
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
            background: Image.network (
              'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining (
          hasScrollBody: false,
          child: Container (
            margin: EdgeInsets.only (
              bottom: 50.0,
            ),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget> [
                Text('row 1'),
                Text('row 2'),
                Text('row 3'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Image.network (
                  'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
                  width: MediaQuery.of(context).size.width,
                ),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
              ],
            ),
          ),
        ),  
      ],
    );
  }
}