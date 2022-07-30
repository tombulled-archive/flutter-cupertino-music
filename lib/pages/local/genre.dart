import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/page_scaffold/title_page_scaffold.dart';

class LocalGenrePage extends StatefulWidget {
  @override
  LocalGenrePageState createState() => LocalGenrePageState();
}

class LocalGenrePageState extends State<LocalGenrePage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments ?? {};
    
    return TitlePageScaffold (
      title: args['genre'],
      previousTitle: args['previousTitle'],
      slivers: <Widget> [
        SliverToBoxAdapter (
          child: Container(),
        )
      ],
    );
  }
}