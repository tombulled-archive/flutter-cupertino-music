import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/page_scaffold/title_page_scaffold.dart';

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(Navigator.of(context).canPop() ?? false);

    return TitlePageScaffold (
      title: 'Explore',
      slivers: <Widget> [
        SliverToBoxAdapter (
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget> [
              Text('foo'),
              Text('bar'),
            ],
          ),
        ),
      ],
    );
  }
}