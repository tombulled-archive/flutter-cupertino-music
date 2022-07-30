import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String initialText;
  final Function onTap;
  final Color cursorColour;
  final bool autofocus;

  SearchBar (
    {
      Key key,
      this.initialText,
      this.onTap,
      this.cursorColour,
      this.autofocus = false,
    }
  ) :
    super(key: key);


  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialText ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField (
      controller: _textController,
      autocorrect: false,
      autofocus: widget.autofocus,
      clearButtonMode: OverlayVisibilityMode.editing,
      cursorColor: widget.cursorColour ?? CupertinoTheme.of(context).textTheme.actionTextStyle.color,
      decoration: BoxDecoration (
        // color: CupertinoColors.darkBackgroundGray,
        color: CupertinoColors.tertiarySystemFill,
        borderRadius: BorderRadius.circular(7.0),
      ),
      enableInteractiveSelection: true,
      enableSuggestions: false,
      // enabled: false,
      onTap: widget.onTap,
      prefix: Padding (
        padding: EdgeInsets.only (
          left: 5.0,
        ),
        child: Icon (
          CupertinoIcons.search,
          size: 20.0,
          color: Colors.grey[700],
        ),
      ),
      padding: EdgeInsets.only (
        top: 8.0,
        bottom: 8.0,
        left: 5.0,
        right: 5.0,
      ),
      placeholder: 'Artists, Songs, Lyrics and More',
      onChanged: (String value) {
        print('on-changed: $value');
      },
      onSubmitted: (value) {
        print('on-submitted: $value');
      }
    );
  }
}