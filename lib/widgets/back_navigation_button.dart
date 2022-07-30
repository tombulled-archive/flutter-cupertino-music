import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BackNavigationButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Color color;

  BackNavigationButton (
    {
      Key key,
      this.onPressed,
      label,
      this.color,
    }
  ) :
    this.label = label ?? '',
    super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? CupertinoTheme.of(context).textTheme.actionTextStyle.color;

    return Container (
      padding: EdgeInsets.only (
        left: 5.0,
      ),
      child: FlatButton (
        onPressed: () {},
        padding: EdgeInsets.all(0.0),
        child: CupertinoButton (
          padding: EdgeInsets.all(0.0),
          child: Container (
            alignment: Alignment.centerLeft,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Icon (
                  Icons.arrow_back_ios,
                  color: color,
                  size: 20.0,
                ),
                Text (
                  this.label,
                  style: TextStyle (
                    color: color,
                    fontSize: 15.0,
                  ),
                ),
              ],
            )
          ),
          onPressed: this.onPressed ?? () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}