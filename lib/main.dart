import 'package:flutter/material.dart';
import 'package:myhub/left_drawer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: new HubHomePage(title: 'News'),
    );
  }
}

class HubHomePage extends StatefulWidget {
  HubHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HubHomePageState createState() => new _HubHomePageState();
}

class _HubHomePageState extends State<HubHomePage> {

  Widget mDrawer;
  BuildContext mContext;
  bool _menuVisible = true;

  void _menuOnPress() {
    //Navigator.of(mContext).push(route);
    setState(() {
      _menuVisible = _menuVisible==true?false:true;
    });
  }

  Widget _createLeftDrawer() {
    if (mDrawer == null)
      mDrawer = new HubDrawer();
    return mDrawer;
  }

  Text _createTextWithSize(String text, double size, Color color) {
    return (new Text(text,
    style: new TextStyle(color: color,
    fontSize: size),));
  }

  Widget _createSideBar() {
    return new AnimatedOpacity(opacity: _menuVisible ? 1.0:0.0, duration:
    Duration(milliseconds: 500), child: Container(width: 200.0, height: 300.0,
      color: Colors.green,));
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: _menuOnPress),
        primary: true,
        titleSpacing: 0.0,
        title: new Text('News',
        style: new TextStyle(inherit: true,
        color: Colors.white,
        fontSize: 22.0,),),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: new Text(widget.title),
        //title: new Icon(Icons.menu),
      ),
      drawer: _createLeftDrawer(),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _createTextWithSize(
              'No activities',
              13.0,
              Colors.black,
            ),
            _createTextWithSize(
              'TAP TO RETRY',
              22.0,
              Colors.green
            ),
            _createSideBar(),
          ],
        ),
      ),
    );
  }
}
