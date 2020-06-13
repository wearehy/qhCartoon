import 'package:flutter/material.dart';

class CartoonIndex extends StatefulWidget {
  CartoonIndex({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartoonIndex createState() => _CartoonIndex();
}

class _CartoonIndex extends State<CartoonIndex> {

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