
import '../common.dart';
import '../global.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {

  /// 处理widget的点击
  Widget handleTap(Function tap, {isMustLogin = false}) {
    return GestureDetector(
      onTap: () {
        // 如果必须登录才能点击，但是又登录了
        if (isMustLogin && !Global.isLoginNotShowLoginDialog()) {
          toast('您当前还未登录');
          return;
        }
        tap();
      },
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  /// 将widget放到数组里返回
  List<Widget> toArray() {
    return [this];
  }
}