import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../back_navigation_button.dart';

class PageScaffold extends StatefulWidget {
  final Widget _action;
  final Widget _background;
  final Color _backgroundColor;
  final Color _borderColor;
  final double _borderSize;
  final double _blur;
  // final Widget _child;
  final double _fadeOffset;
  final double _height;
  final TextStyle _largeTitleStyle;
  final String _largeTitleText;
  final String _leadingText;
  final List<Color> _shadowColors;
  final double _shadowSize;
  final List<Widget> _slivers;
  final TextStyle _titleStyle;
  final String _titleText;
  final Widget _trailing;

  PageScaffold (
    {
      Key key,
      action,
      background,
      backgroundColor,
      borderColor,
      borderSize,
      blur,
      // child,
      fadeOffset,
      height,
      largeTitleStyle,
      largeTitleText,
      leadingText,
      shadowColors,
      shadowSize,
      slivers,
      titleStyle,
      titleText,
      trailing,
    }
  ) :
    _action = action,
    _background = background,
    _backgroundColor = backgroundColor ?? Colors.blue,
    _borderColor = borderColor ?? Colors.grey[800],
    _borderSize = borderSize ?? 0.2,
    _blur = blur ?? 10.0,
    // _child = child,
    _fadeOffset = fadeOffset ?? 10.0,
    _height = height ?? 100.0,
    _largeTitleStyle = largeTitleStyle ?? TextStyle(color: Colors.white, fontSize: 30.0),
    _largeTitleText = largeTitleText ?? '',
    _leadingText = leadingText ?? 'Back',
    _shadowColors = shadowColors ?? [Colors.grey.withOpacity(0.0), Colors.black54],
    _shadowSize = shadowSize ?? 50.0,
    _slivers = slivers ?? [],
    _titleStyle = titleStyle,
    _titleText = titleText ?? '',
    _trailing = trailing,
    super(key: key);

  @override
  PageScaffoldState createState() => PageScaffoldState();
}

class PageScaffoldState extends State<PageScaffold> {
  ScrollController scrollController;
  double lastFadeOpacity = 1.0;

  scrollListener() {
    if (currentFadeOpacity != lastFadeOpacity) {
      setState (
        () {
          lastFadeOpacity = currentFadeOpacity;
        }
      );
    }
  }

  double get currentFadeOpacity {
    // print("_scrollController.hasClients = ${_scrollController.hasClients}");
    if (! scrollController.hasClients)
    {
      // print("_scrollController.hasClients = ${_scrollController.hasClients}");
      return lastFadeOpacity;
    }
    double scroll_offset = scrollController.offset;
    // double sliver_height = MediaQuery.of(context).size.width;
    // double sliver_height = (MediaQuery.of(context).size.height / 3) * 2;
    double sliver_height = widget._height;
    double bar_height = kToolbarHeight;
    double trigger_offset = widget._fadeOffset;

    // print("_scrollController.hasClients = ${_scrollController.hasClients}");
    // print("scroll_offset = ${_scrollController.offset}");
    // print("sliver_height = ${MediaQuery.of(context).size.height / 2}");
    // print("bar_height = ${kToolbarHeight}");
    // print("trigger_offset = ${fadeTriggerOffset}");

    // print("calc: ${scroll_offset - sliver_height}");

    double depth = (scroll_offset - sliver_height + bar_height + trigger_offset) / trigger_offset;

    if (depth <= 0) {
      return 1;
    }
    else if (depth >= 1) {
      return 0;
    }
    
    return 1 - depth;
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget leading;

    if (Navigator.of(context).canPop()) {
      leading = BackNavigationButton (
        label: widget._leadingText,
      );
    }

    return CupertinoPageScaffold (
      child: CupertinoScrollbar (
        controller: this.scrollController,
        child: CustomScrollView (
        controller: this.scrollController,
        physics: AlwaysScrollableScrollPhysics (
          parent: BouncingScrollPhysics(),
        ),
        slivers: <Widget> [
          SliverAppBar (
            leadingWidth: 100.0,
            expandedHeight: widget._height,
            floating: false,
            pinned: true,
            stretch: true,
            backgroundColor: new Color.fromRGBO(0, 0, 0, 0),
            centerTitle: true,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            leading: leading,
            // actions: widget._actions,
            actions: <Widget> [
              Padding (
                padding: EdgeInsets.only (
                  right: 20.0,
                ),
                child: widget._action,
              )
            ],
            toolbarHeight: 45.0,
            bottom: PreferredSize (
              preferredSize: Size.fromHeight(widget._borderSize),
              child: Opacity (
                opacity: 1 - currentFadeOpacity,
                child: Container (
                  height: widget._borderSize,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration (
                    color: widget._borderColor,
                  ),
                ),
              ),
            ),
            title: Opacity (
              opacity: 1 - currentFadeOpacity,
              child: Text (
                widget._titleText,
                style: widget._titleStyle,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar (
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              titlePadding: EdgeInsets.all(0.0),
              title: Stack (
                alignment: AlignmentDirectional.bottomStart,
                children: <Widget> [
                  Opacity (
                    opacity: currentFadeOpacity,
                    child: Container (
                      height: widget._shadowSize,
                      decoration: BoxDecoration (
                        gradient: LinearGradient (
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: widget._shadowColors,
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Positioned (
                    bottom: 10.0,
                    left: 10.0,
                    right: 10.0,
                    child: IntrinsicHeight (
                      child: Opacity (
                        opacity: currentFadeOpacity,
                        child: Row (
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget> [
                            Expanded (
                              flex: 7,
                              child: Container (
                                alignment: Alignment.bottomLeft,
                                child: FittedBox (
                                  fit: BoxFit.contain,
                                  child: Text (
                                    widget._largeTitleText,
                                    style: widget._largeTitleStyle,
                                  ),
                                ),
                              )
                            ),
                            Expanded (
                              flex: 3,
                              child: Container (
                                alignment: Alignment.bottomRight,
                                child: widget._trailing,
                              )
                            ),
                          ],
                        )
                      )
                    ),
                  ),
                  Opacity (
                    opacity: 1 - currentFadeOpacity,
                    child: Container (
                      child: ClipRect (
                        child: BackdropFilter (
                          filter: ImageFilter.blur (
                            sigmaX: widget._blur,
                            sigmaY: widget._blur,
                          ),
                          child: Container (
                            color: widget._backgroundColor,
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              ),
              background: widget._background,
            ),
          ),
          ...widget._slivers,
          SliverPadding (
            padding: EdgeInsets.only (
              bottom: 50.0 + 20.0,
            )
          ),
        ],
      ),
    ));
  }
}