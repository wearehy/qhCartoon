import 'package:flutter/material.dart';

class ProjectAppBar extends StatefulWidget {
  ProjectAppBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProjectAppBar createState() => _ProjectAppBar();
}

class _ProjectAppBar extends State<ProjectAppBar> {

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