import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'My Flutter Pad'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const kExpandedHeight = 300.0;

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener((){
        final isNotExpanded = _scrollController.hasClients && _scrollController.offset > kExpandedHeight - kToolbarHeight;
        if (isNotExpanded != _showTitle){
          setState(() {
            _showTitle = isNotExpanded;
          });
        }
      });
  }

  bool _showTitle = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {},),
            expandedHeight: kExpandedHeight,
            title: _showTitle ? Text('_SliverAppBar') : null,
            flexibleSpace: _showTitle ? null : FlexibleSpaceBar(
              // title: new Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     Text('_SliverAppBar'),
              //     Text('subtitle'),
              //   ],
              title: Text('_SliverAppBar', style:TextStyle(fontSize: 70.0))
              ),
              // background: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text('Info'),
              //   ],
              // ),
            ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate(List<Text>.generate(100, (int i) {
              return Text("List item $i");
            })),
          ),
        ]
      ),
    );
  }
}