import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/page_scaffold/title_page_scaffold.dart';
import '../../widgets/action_item/text_action_item.dart';

class LocalAlbumsPage extends StatefulWidget {
  @override
  LocalAlbumsPageState createState() => LocalAlbumsPageState();
}

class LocalAlbumsPageState extends State<LocalAlbumsPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments ?? {};
    
    return TitlePageScaffold (
      title: 'Albums',
      previousTitle: args['previousTitle'],
      action: TextActionItem (
        'Sort',
        onTap: () {
          print('sort!');
        },
      ),
      slivers: <Widget> [
        SliverToBoxAdapter (
          child: Container(),
        )
      ],
    );
  }
}