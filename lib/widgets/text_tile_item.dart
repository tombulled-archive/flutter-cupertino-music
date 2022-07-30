import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTileItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color backgroundColor;
  final EdgeInsets padding;
  final bool arrow;
  final TextStyle textStyle;
  final String text;

  TextTileItem
  (
    this.text,
    {
      Key key,
      this.onTap,
      backgroundColor,
      this.padding,
      this.arrow = true,
      this.textStyle,
    }
  ):
    this.backgroundColor = backgroundColor ?? Colors.transparent,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material (
      color: this.backgroundColor,
      child: InkWell (
        onTap: this.onTap,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Padding (
          padding: this.padding ?? EdgeInsets.only (
            left: 20.0,
            right: 20.0,
            top: 15.0,
            bottom: 15.0,
          ),
          child: Row (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Expanded (
                child: Text (
                  this.text ?? '',
                  style: this.textStyle ?? TextStyle (
                    color: CupertinoTheme.of(context).textTheme.actionTextStyle.color,
                    fontSize: 20.0,
                  )
                ),
              ),
              Visibility (
                visible: this.arrow,
                child: Icon (
                  Icons.arrow_forward_ios,
                  color: Color(0xFF48484A),
                  size: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}