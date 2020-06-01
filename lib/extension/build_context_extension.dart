import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {

  Future<T> pushPage<T>(Widget widget) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }


}