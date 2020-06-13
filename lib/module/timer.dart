import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  Timer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Timer createState() => _Timer();
}

class _Timer extends State<Timer> {

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