import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tabs/library.dart';
import '../tabs/explore.dart';
import '../tabs/search.dart';

import '../pages/local/albums.dart';
import '../pages/local/artists.dart';
import '../pages/local/genres.dart';
import '../pages/local/genre.dart';
import '../pages/local/playlists.dart';
import '../pages/local/songs.dart';
// import '../pages/modal/search.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold (
        tabBar: CupertinoTabBar (
          backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.8),
          activeColor: CupertinoTheme.of(context).textTheme.actionTextStyle.color,
          // activeColor: Color(0xFFFF375F),
          inactiveColor: CupertinoColors.inactiveGray,
          items: [
              BottomNavigationBarItem (
                icon: Icon(Icons.library_music),
                label: 'Library',
              ),
              BottomNavigationBarItem (
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem (
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
        ),
        tabBuilder: (context, index) {
          List<Widget> tabs = <Widget> [
            LibraryTab(),
            ExploreTab(),
            SearchTab(),
          ];
          
          return CupertinoTabView (
            builder: (context) {
              return tabs[index];
            },
            routes: {
              'local/albums': (_) => LocalAlbumsPage(),
              'local/artists': (_) => LocalArtistsPage(),
              'local/genres': (_) => LocalGenresPage(),
              'local/genre': (_) => LocalGenrePage(),
              'local/playlists': (_) => LocalPlaylistsPage(),
              'local/songs': (_) => LocalSongsPage(),

              // 'modal/search': (_) => ModalSearchPage(),
              // 'modal/search': (context) => MaterialPageRoute(builder: (context) => ModalSearchPage()),
              // 'modal/search': (context) => new CupertinoPageRoute(builder: (context) => ModalSearchPage()) as Widget,
            },
          );
        },
      );
  }
}