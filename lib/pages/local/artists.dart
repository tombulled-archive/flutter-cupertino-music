import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/page_scaffold/title_page_scaffold.dart';

class LocalArtistsPage extends StatefulWidget {
  @override
  LocalArtistsPageState createState() => LocalArtistsPageState();
}

class LocalArtistsPageState extends State<LocalArtistsPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments ?? {};
    
    return TitlePageScaffold (
      title: 'Artists',
      previousTitle: args['previousTitle'],
      // child: Container (),
      slivers: <Widget> [
        SliverToBoxAdapter (
          child: Container(),
        )
      ],
    );
  }
}