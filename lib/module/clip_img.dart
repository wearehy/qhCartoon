import 'package:flutter/material.dart';

class ClipImg extends StatefulWidget {
  ClipImg({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ClipImg createState() => _ClipImg();
}

class _ClipImg extends State<ClipImg> {

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