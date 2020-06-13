import 'package:flutter/material.dart';

class CartoonLists extends StatefulWidget {
  CartoonLists({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartoonLists createState() => _CartoonLists();
}

class _CartoonLists extends State<CartoonLists> {

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