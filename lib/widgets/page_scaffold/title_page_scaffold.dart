import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page_scaffold.dart';
// import '../action_item/text_action_item.dart';
// import '../action_item/icon_action_item.dart';

class TitlePageScaffold extends StatelessWidget {
  // final Widget _child;
  final List<Widget> _slivers;
  final String _title;
  final String _previousTitle;
  final Widget _action;

  TitlePageScaffold (
    {
      Key key,
      // child,
      slivers,
      title,
      previousTitle,
      action,
    }
  ) :
    // _child = child,
    _slivers = slivers ?? [],
    _title = title ?? '',
    _previousTitle = previousTitle,
    _action = action,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold (
      titleText: this._title,
      largeTitleText: this._title,
      leadingText: this._previousTitle,
      shadowSize: 0.0,
      largeTitleStyle: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      titleStyle: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.8),
      // child: this._child,
      action: this._action,
      slivers: this._slivers,
    );
  }
}