import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  final Widget child;
  final Function onTap;

  ActionItem (
    {
      Key key,
      this.child,
      this.onTap,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material (
      color: Colors.transparent,
      child: InkWell (
        onTap: () {},
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: CupertinoButton (
          onPressed: this.onTap ?? () {},
          minSize: 0.0,
          padding: EdgeInsets.all(0.0),
          child: Container (
            alignment: Alignment.centerRight,
            child: this.child,
          )
        ),
      ),
    );
  }
}