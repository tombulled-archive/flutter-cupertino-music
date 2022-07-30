import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../widgets/title_page_scaffold.dart';
import '../widgets/text_tile_item.dart';
import '../widgets/partial_divider.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Map<String, String> args = ModalRoute.of(context).settings.arguments ?? {};

    // print(args['foo']);

    // args.putIfAbsent('foo', () => 'no foo :(');

    // print(args['foo'] ?? 'nothing there?');

    return CustomScrollView (
      physics: AlwaysScrollableScrollPhysics (
        parent: BouncingScrollPhysics(),
      ),
      slivers: <Widget> [
        // CupertinoSliverRefreshControl (
        //   refreshTriggerPullDistance: 1000000000000,
        // ),
        CupertinoSliverNavigationBar (
          largeTitle: Text('title'),
        ),
        // SliverFillRemaining(
        //   child: Center(
        //     child: Text("Swipe down"),
        //   ),
        // ),
        SliverFillRemaining (
          hasScrollBody: false,
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget> [
              Material (
                child: Theme (
                  data: ThemeData (
                    brightness: Brightness.dark,
                    dividerColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
                    // tile
                  ),
                  child: ListTile (
                  tileColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
                  // dense: true,
                  // selectedTileColor: Colors.red,
                  // selectedTileColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
                  // focusColor: Colors.blue,
                  // selected: true,
                  title: Text (
                    'Playlists',
                    style: TextStyle (
                      color: CupertinoTheme.of(context).textTheme.actionTextStyle.color,
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Icon (
                    Icons.arrow_forward_ios,
                    size: 14.0,
                    color: Color(0xFF48484A),
                  ),
                ),
              ),),
              Divider (
                thickness: 1,
                color: Color(0xFF151517),
                indent: 20.0,
                endIndent: 0.0,
                height: 0,
              ),
              Text('foo'),
              Text('bar'),
              TextTileItem (
                'foo bar',
                onTap: () {
                  Navigator.pushNamed(context, 'deeper');
                },
                // backgroundColor: Colors.red,
                // padding: EdgeInsets.all(5),
                // arrow: false,
                // textStyle: TextStyle (
                //   color: Colors.pink,
                // ),
              ),
              PartialDivider(),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
              Text('foo'),
              Text('bar'),
            ],
          ),
        )
      ],
    );
  }
}