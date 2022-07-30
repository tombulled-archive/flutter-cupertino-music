import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_item.dart';

class TextActionItem extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Function onTap;

  TextActionItem (
    text,
    {
      Key key,
      this.textStyle,
      this.onTap,
    }
  ) :
    this.text = text ?? '',
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionItem (
      onTap: this.onTap,
      child: Text (
        this.text,
        style: this.textStyle ?? TextStyle (
          color: CupertinoTheme.of(context).textTheme.actionTextStyle.color,
          fontSize: 17.0,
        ),
      )
    );
  }
}