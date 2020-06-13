import 'package:flutter/material.dart';

class CartoonSynopsisTabBarList extends StatefulWidget {
  CartoonSynopsisTabBarList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartoonSynopsisTabBarList createState() => _CartoonSynopsisTabBarList();
}

class _CartoonSynopsisTabBarList extends State<CartoonSynopsisTabBarList> {

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