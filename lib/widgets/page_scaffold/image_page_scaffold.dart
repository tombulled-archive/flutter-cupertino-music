import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'page_scaffold.dart';

class ImagePageScaffold extends StatelessWidget {
  final Widget _child;
  final Image _image;
  final String _title;

  ImagePageScaffold (
    {
      Key key,
      child,
      image,
      title,
    }
  ) :
    _child = child,
    _image = image,
    _title = title ?? '',
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold (
      titleText: this._title,
      largeTitleText: this._title,
      largeTitleStyle: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith (
        color: Colors.white,
      ),
      fadeOffset: 30.0,
      height: math.min (
        (2 / 3) * MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width,
      ),
      background: this._image,
      titleStyle: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.8),
      // child: this._child,
      slivers: <Widget> [
        SliverToBoxAdapter (
          child: this._child,
        ),
      ],
    );
  }
}