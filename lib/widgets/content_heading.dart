import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'action_item/text_action_item.dart';

class ContentHeading extends StatelessWidget {
  final String heading;
  final String action;
  final Function onTap;
  final EdgeInsetsGeometry padding;

  ContentHeading (
    this.heading,
    {
      Key key,
      this.action,
      this.onTap,
      this.padding,
    }
  ) :
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      padding: this.padding ?? EdgeInsets.all(20.0),
      alignment: Alignment.topLeft,
      child: Row (
        children: <Widget> [
          Expanded (
            child: Text (
              this.heading ?? '',
              style: TextStyle (
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextActionItem (
            this.action ?? '',
            onTap: this.onTap ?? () {},
          ),
        ],
      ),
    );
  }
}