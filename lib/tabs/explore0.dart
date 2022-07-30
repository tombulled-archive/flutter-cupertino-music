import 'package:flutter/cupertino.dart';

import '../widgets/page_scaffold/image_page_scaffold.dart';

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImagePageScaffold (
      title: 'Explore',
      image: Image.network (
        'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
        fit: BoxFit.cover,
      ),
      child: Container (
            // margin: EdgeInsets.only (
            //   bottom: 50.0,
            // ),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget> [
                Text('row 1'),
                Text('row 2'),
                Text('row 3'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Image.network (
                  'https://i.scdn.co/image/54b96d11cffd531ae2b124c802260fb06c42d8c4',
                  width: MediaQuery.of(context).size.width,
                ),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
                Text('row n'),
              ],
            ),
          ),);
  }
}