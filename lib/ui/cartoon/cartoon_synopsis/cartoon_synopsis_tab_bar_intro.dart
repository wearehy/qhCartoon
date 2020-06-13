import 'package:flutter/material.dart';

class CartoonSynopsisTabBarIntro extends StatefulWidget {
  CartoonSynopsisTabBarIntro({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartoonSynopsisTabBarIntro createState() => _CartoonSynopsisTabBarIntro();
}

class _CartoonSynopsisTabBarIntro extends State<CartoonSynopsisTabBarIntro> {

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