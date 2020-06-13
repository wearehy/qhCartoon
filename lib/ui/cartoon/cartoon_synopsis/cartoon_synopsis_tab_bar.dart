import 'package:flutter/material.dart';

class CartoonSynopsisTabBar extends StatefulWidget {
  CartoonSynopsisTabBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartoonSynopsisTabBar createState() => _CartoonSynopsisTabBar();
}

class _CartoonSynopsisTabBar extends State<CartoonSynopsisTabBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}