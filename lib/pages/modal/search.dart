import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../../widgets/page_scaffold/title_page_scaffold.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/action_item/text_action_item.dart';

class ModalSearchPage extends StatefulWidget {
  @override
  ModalSearchPageState createState() => ModalSearchPageState();
}

class ModalSearchPageState extends State<ModalSearchPage> {
  bool visible = true;
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> tabs = const <int, Widget> {
    0: Text (
      'Apple Music',
      style: TextStyle (
        fontSize: 13.0,
      ),
    ),
    1: Text (
      'Your Library',
      style: TextStyle (
        fontSize: 13.0,
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments ?? {};

    return CupertinoPageScaffold (
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Padding (
            padding: EdgeInsets.only (
              left: 20.0,
              right: 20.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Row (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Expanded (
                  child: Hero (
                    tag: 'search-bar',
                    child: SearchBar (
                      autofocus: true,
                    ),
                  ),
                ),
                Padding (
                  padding: EdgeInsets.only (
                    left: 10.0,
                  ),
                ),
                Opacity (
                  opacity: this.visible ? 1 : 0,
                  child: TextActionItem (
                    'Cancel',
                    onTap: () {
                      print('action-item: on-cancel');
                      Navigator.of(context).pop();
                      setState(() {
                        this.visible = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Visibility (
            visible: this.visible,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Row (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded (
                      child: Padding (
                        padding: EdgeInsets.only (
                          left: 20.0,
                          right: 20.0,
                          bottom: 10.0,
                        ),
                        child: CupertinoSlidingSegmentedControl (
                          groupValue: this.segmentedControlGroupValue,
                          onValueChanged: (index) {
                            print('sliding-segment:value-changed -> $index');

                            setState(() {
                              this.segmentedControlGroupValue = index;
                            });
                          },
                          children: this.tabs,
                        ),
                      ),
                    ),
                  ],
                ),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
                Text('foo'),
              ],
            ),
          ),
        ],
      ),
    );
    
    // return Column (
    //   children: <Widget> [
    //     Row (
    //       children: <Widget> [
    //         // Padding (
    //           // padding: EdgeInsets.all(20.0),
    //           // child: Hero (
    //             // tag: 'search-bar',
    //             SearchBar (
    //               onTap: () {
    //                 print('search-bar: on-tap');
    //               }
    //             ),
    //           // ),
    //         // ),
    //         // Text('foo'),
    //       ],
    //     ),
    //   ],
    // );
  }
}