import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // double sliver_height = MediaQuery.of(context).size.height / 2;
    double sliver_height = MediaQuery.of(context).size.width;
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
            // expandedHeight: MediaQuery.of(context).size.height / 2,
            expandedHeight: MediaQuery.of(context).size.width,
            // floating: false,
            pinned: true,
            stretch: true,
            // backgroundColor: Colors.white,
            // backgroundColor: new Color.fromRGBO(50, 50, 50, 0.5),
            backgroundColor: new Color.fromRGBO(0, 0, 0, 0),
            // backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
            // backgroundColor: Colors.black.withOpacity(0.5),
            centerTitle: true,
            // elevation: 1.0,
            elevation: 0.0,
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
            // title: Stack (
            //   children: <Widget> [
            //     Container (
            //       // width: MediaQuery.of(context).size.width,
            //       width: 500.0,
            //       height: 50.0,
            //       decoration: BoxDecoration (
            //         color: Colors.red,
            //       ),
            //     ),
            //   ],
            // ),
            // actions: [
            //   Text('some action'),
            // ],
            // leading: Text('leading'),
            flexibleSpace: FlexibleSpaceBar(
                // centerTitle: true,
                stretchModes: [
                  StretchMode.zoomBackground,
                  // StretchMode.fadeTitle,
                ],
                // titlePadding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                titlePadding: EdgeInsets.all(0.0),
                // title: Opacity (
                //   // opacity: currentFadeOpacity,
                //   opacity: 1.0,
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
                          style: TextStyle (
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                    // BackdropFilter(
                    //     filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    //     child: Container (
                    //       height: 50.0,
                    //       width: MediaQuery.of(context).size.width,
                    //       child: Text('a')
                    //     ),
                    //   ),
                    // ),
                    Opacity (
                      opacity: 1 - currentFadeOpacity,
                      child: Container(
                        // top: 0,
                        // left: 0,
                        // width: MediaQuery.of(context).size.width,
                        // height: 56.0,
                        // Note: without ClipRect, the blur region will be expanded to full
                        // size of the Image instead of custom size
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      )
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 50.0,
                    //   child: BackdropFilter(
                    //     filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    //     child: Container(
                    //       color: Colors.black.withOpacity(0),
                    //     ),
                    //   ),
                    // )
                    // Positioned (
                    //   height: 50.0,
                    //   // bottom: 0.0,
                    //   width: MediaQuery.of(context).size.width,
                    //   // child: ClipRect(
                    //   child: Positioned.fill(child: BackdropFilter(
                    //     filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    //     // child: Container (
                    //     //   height: 50.0,
                    //     //   width: MediaQuery.of(context).size.width,
                    //       // child: Text(' '),
                    //     // ),
                    //   )),
                    // // ),
                    // )
                    // Container (
                    //   height: 50.0,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: child: ClipRect(child: BackdropFilter(
                    //     filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    //     child: Container (
                    //       height: 50.0,
                    //       width: MediaQuery.of(context).size.width,
                    //       // child: Text(' '),
                    //     ),
                    //   ))),
                      // decoration: BoxDecoration (
                      //   color: Colors.red,
                      // ),
                    // ),
                    // ClipRect(
                    //   child: BackdropFilter(
                    //     filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    //     child: Container (
                    //       height: 50.0,
                    //       width: MediaQuery.of(context).size.width,
                    //       child: Text(' '),
                    //     ),
                    //   ),
                    // ),
                    // Backdrop FIlter for blur effect <---------------------------------------
                  ],
                ),
                // title: Container(
                //   height: MediaQuery.of(context).size.width / 4,
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //           begin: FractionalOffset.topCenter,
                //           end: FractionalOffset.bottomCenter,
                //           colors: [
                //             Colors.grey.withOpacity(0.0),
                //             Colors.black54,
                //           ],
                //           stops: [0.0, 1.0],
                //         ),
                //       ),
                //     ),


                // title: Opacity (
                //   // opacity: isShrink ? 0.0 : 1.0,
                //   opacity: currentFadeOpacity,
                //   child: Text (
                //     "Aquilo",
                //     style: TextStyle (
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // background: Stack (
                //   children: <Widget> [
                //     Container (
                //       decoration: BoxDecoration (
                //         image: DecorationImage (
                //           fit: BoxFit.cover,
                //           image: NetworkImage('https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4'),
                //         )
                //       ),
                //     ),
                //     Container(
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //           begin: FractionalOffset.topCenter,
                //           end: FractionalOffset.bottomCenter,
                //           colors: [
                //             Colors.grey.withOpacity(0.0),
                //             // Colors.black54,
                //             Colors.red,
                //           ],
                //           stops: [0.95, 1.0],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                background: Container (
                  decoration: BoxDecoration (
                    image: DecorationImage (
                      fit: BoxFit.cover,
                      image: NetworkImage('https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4'),
                    )
                  ),
                ),
                // background: Image.network (
                //   'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
                //   fit: BoxFit.cover,
                // ),
            )
                // ),
          //       background: new AspectRatio(
          // aspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2),
          // child: new Container(
          //   decoration: new BoxDecoration(
          //     image: new DecorationImage(
          //       fit: BoxFit.contain,
          //       alignment: FractionalOffset.topCenter,
          //       image: new NetworkImage('https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4'),
          //     )
          //   ),
          // ))),
          ),
          SliverFillRemaining (
            hasScrollBody: false,
            child: Container(margin: EdgeInsets.only(bottom:50.0), child:Column (
            // child: Column (
              // mainAxisSize: MediaQuery.of(context).size.width,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget> [
                Text('row 1'),
                Text('row 2'),
                Text('row 3'),
                Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                // Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Image.network('https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4', width: MediaQuery.of(context).size.width,),
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
            )),
            // child: ListView (
            //   scrollDirection: Axis.horizontal,
            //   children: <Widget> [
            //     Text('Content!'),
            //     Text('Content!'),
            //     Text('Content!'),
            //   ],
            // ),
          ),
        ],
      // },
      // body: Center(
      //   child: Text("hello world"),
      // ),
    );
  }
  }