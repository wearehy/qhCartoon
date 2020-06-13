import 'package:flutter/material.dart';

class BuildGridView extends StatefulWidget {
  BuildGridView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BuildGridView createState() => _BuildGridView();
}

class _BuildGridView extends State<BuildGridView> {

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