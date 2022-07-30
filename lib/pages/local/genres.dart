import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/page_scaffold/title_page_scaffold.dart';
import '../../widgets/text_tile_item.dart';
import '../../widgets/partial_divider.dart';

class LocalGenresPage extends StatefulWidget {
  @override
  LocalGenresPageState createState() => LocalGenresPageState();
}

class LocalGenresPageState extends State<LocalGenresPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments ?? {};
    
    return TitlePageScaffold (
      title: 'Genres',
      previousTitle: args['previousTitle'],
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
                      'Alternative',
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'local/genre',
                          arguments: <String, String> {
                            'previousTitle': 'Genres',
                            'genre': 'Alternative',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'Blues',
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'local/genre',
                          arguments: <String, String> {
                            'previousTitle': 'Genres',
                            'genre': 'Blues',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'Rock',
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'local/genre',
                          arguments: <String, String> {
                            'previousTitle': 'Genres',
                            'genre': 'Rock',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
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