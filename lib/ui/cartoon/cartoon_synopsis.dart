import 'package:flutter/material.dart';

class CartoonSynopsis extends StatefulWidget {
  CartoonSynopsis({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartoonSynopsis createState() => _CartoonSynopsis();
}

class _CartoonSynopsis extends State<CartoonSynopsis> {

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