import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_item.dart';

class IconActionItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final Function onTap;

  IconActionItem (
    this.icon,
    {
      Key key,
      this.color,
      this.size = 17.0,
      this.onTap,
    }
  ) :
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionItem (
      onTap: this.onTap,
      child: Icon (
        this.icon,
        color: this.color ?? CupertinoTheme.of(context).textTheme.actionTextStyle.color,
        size: this.size,
      ),
    );
  }
}