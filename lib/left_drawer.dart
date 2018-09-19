import 'package:flutter/material.dart';
import 'user_card.dart';
import 'data_utils.dart';

class HubDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HubDrawerState();
  }
}

class HubDrawerState extends State<HubDrawer> with SingleTickerProviderStateMixin  {

  Widget _child = new ListView(
    children: <Widget>[
      new UserAccountsDrawerHeader(
        accountName: DataUtils.getName(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: _child,
    );
  }
}