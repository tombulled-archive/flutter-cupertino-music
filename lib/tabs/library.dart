import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/page_scaffold/title_page_scaffold.dart';
import '../widgets/text_tile_item.dart';
import '../widgets/partial_divider.dart';
import '../widgets/action_item/text_action_item.dart';
import '../widgets/content_heading.dart';

class LibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(Navigator.of(context).canPop() ?? false);

    return TitlePageScaffold (
      title: 'Library',
      action: TextActionItem (
        'Edit',
        onTap: () {
          print('edit!');
        },
      ),
      slivers: <Widget> [
        SliverToBoxAdapter (
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget> [
              PartialDivider(),
              Container (
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    TextTileItem (
                      'Playlists',
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'local/playlists',
                          arguments: <String, String> {
                            'previousTitle': 'Library',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'Artists',
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'local/artists',
                          arguments: <String, String> {
                            'previousTitle': 'Library',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'Albums',
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'local/albums',
                          arguments: <String, String> {
                            'previousTitle': 'Library',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'Songs',
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'local/songs',
                          arguments: <String, String> {
                            'previousTitle': 'Library',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'Genres',
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'local/genres',
                          arguments: <String, String> {
                            'previousTitle': 'Library',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    ContentHeading (
                      'Recently Added',
                      action: 'See All',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverPadding (
            padding: EdgeInsets.only (
              left: 20.0,
              right: 20.0,
            ),
            sliver: SliverGrid.extent (
              maxCrossAxisExtent: 200.0,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.77,
              children: <Widget> [
                Container(
                  // width: 100,
                  // height: 100,
                  child: CupertinoContextMenu(
                    previewBuilder: (BuildContext context, Animation<double> animation, Widget child) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        // This ClipRRect rounds the corners of the image when the
                        // CupertinoContextMenu is open, even though it's not rounded when
                        // it's closed. It uses the given animation to animate the corners
                        // in sync with the opening animation.
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(64.0 * animation.value),
                          child: Image.network('https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440'),
                        ),
                      );
                    },
                    child: GridTile (
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ClipRRect (
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network('https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440'),
                      ),
                      Container (
                        height: 10.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Philophobia',
                          )
                        ),
                      ),
                      Container (
                        height: 5.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Amber Run',
                            style: TextStyle (
                              color: Colors.grey[600],
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                    actions: <Widget>[
                      CupertinoContextMenuAction(
                        child: const Text('Play'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        trailingIcon: Icons.play_arrow,
                      ),
                      CupertinoContextMenuAction(
                        child: const Text('Delete from Library'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoContextMenuAction(
                        child: const Text('Add to a Playlist'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                GridTile (
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ClipRRect (
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network('https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440'),
                      ),
                      Container (
                        height: 10.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Philophobia',
                          )
                        ),
                      ),
                      Container (
                        height: 5.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Amber Run',
                            style: TextStyle (
                              color: Colors.grey[600],
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                GridTile (
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ClipRRect (
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network('https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440'),
                      ),
                      Container (
                        height: 10.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Philophobia',
                          )
                        ),
                      ),
                      Container (
                        height: 5.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Amber Run',
                            style: TextStyle (
                              color: Colors.grey[600],
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                GridTile (
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ClipRRect (
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network('https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440'),
                      ),
                      Container (
                        height: 10.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Philophobia',
                          )
                        ),
                      ),
                      Container (
                        height: 5.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Amber Run',
                            style: TextStyle (
                              color: Colors.grey[600],
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                GridTile (
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ClipRRect (
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network('https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440'),
                      ),
                      Container (
                        height: 10.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Philophobia',
                          )
                        ),
                      ),
                      Container (
                        height: 5.0,
                      ),
                      Expanded (
                        child: FittedBox (
                          fit: BoxFit.fitHeight,
                          child: Text (
                            'Amber Run',
                            style: TextStyle (
                              color: Colors.grey[600],
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}