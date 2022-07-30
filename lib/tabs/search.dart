import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/page_scaffold/title_page_scaffold.dart';
import '../widgets/text_tile_item.dart';
import '../widgets/partial_divider.dart';
import '../widgets/content_heading.dart';
import '../widgets/search_bar.dart';

import '../pages/modal/search.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(Navigator.of(context).canPop() ?? false);

    return TitlePageScaffold (
      title: 'Search',
      slivers: <Widget> [
        SliverToBoxAdapter (
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget> [
              Container (
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Padding (
                      padding: EdgeInsets.all(20.0),
                      child: Hero (
                        tag: 'search-bar',
                        child: SearchBar (
                          cursorColour: Colors.transparent,
                          onTap: () {
                            print('search-bar: on-tap');
                            // Navigator.of(context).pushNamed('modal/search');
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ModalSearchPage()));
                            // Navigator.of(context).push(ModalRoute(builder: (context) => ModalSearchPage()));
                            Navigator.of(context).push (
                              PageRouteBuilder (
                                pageBuilder: (context, animation, secondaryAnimation) => ModalSearchPage(),
                                transitionDuration: Duration(milliseconds: 300),
                                // transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                                // transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  // print(animation);

                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                }
                                // transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                //   animation = CurvedAnimation (
                                //     curve: Curves.bounceIn,
                                //     parent: animation,
                                //   );

                                //   return RotationTransition (
                                //     turns: animation,
                                //     child: child,
                                //   );
                                // }
                              ),
                            );
                          }
                        ),
                      ),
                    ),
                    ContentHeading (
                      'Recent',
                      action: 'Clear',
                      padding: EdgeInsets.only (
                        left: 20.0,
                        right: 20.0,
                        bottom: 10.0,
                      ),
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'the white stripes',
                      arrow: false,
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'search',
                          arguments: <String, String> {
                            'previousTitle': 'Search',
                            'query': 'the white stripes',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'Kasabian',
                      arrow: false,
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'search',
                          arguments: <String, String> {
                            'previousTitle': 'Search',
                            'query': 'Kasabian',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'Aquilo',
                      arrow: false,
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'search',
                          arguments: <String, String> {
                            'previousTitle': 'Search',
                            'query': 'Aquilo',
                          },
                        );
                      },
                    ),

                    ContentHeading (
                      'Trending',
                      padding: EdgeInsets.only (
                        left: 20.0,
                        right: 20.0,
                        bottom: 10.0,
                        top: 40.0,
                      ),
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'mood swings',
                      arrow: false,
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'search',
                          arguments: <String, String> {
                            'previousTitle': 'Search',
                            'query': 'mood swings',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'euphoria',
                      arrow: false,
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'search',
                          arguments: <String, String> {
                            'previousTitle': 'Search',
                            'query': 'euphoria',
                          },
                        );
                      },
                    ),
                    PartialDivider(),
                    TextTileItem (
                      'marilyn manson',
                      arrow: false,
                      onTap: () {
                        Navigator.pushNamed (
                          context,
                          'search',
                          arguments: <String, String> {
                            'previousTitle': 'Search',
                            'query': 'marilyn manson',
                          },
                        );
                      },
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