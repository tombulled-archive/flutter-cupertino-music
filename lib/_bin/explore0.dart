import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/page_scaffold.dart';

import 'dart:math' as math;

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return CustomScrollView (
    //   controller: this.scrollController,
    //   physics: const BouncingScrollPhysics(),
    //   slivers: <Widget> [
        return PageScaffold (
          height: math.min (
            (2 / 3) * MediaQuery.of(context).size.height,
            MediaQuery.of(context).size.width,
          ),
          titleText: 'Aquilo',
          largeTitleText: 'Aquilo',
          titleStyle: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          largeTitleStyle: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith (
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
          backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.8),
          background: Image.network (
            'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
            fit: BoxFit.cover,
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
        );
    //   ],
    // ),
  }
}