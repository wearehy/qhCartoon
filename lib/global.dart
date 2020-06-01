
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/db/user_model.dart';

/// 全局操作
class Global {
  static final GlobalKey<NavigatorState> navigatorState = new GlobalKey();
  static final GlobalKey homeMainKey = new GlobalKey();

  static BuildContext get context => navigatorState.currentContext;

  static UserModel get user => Provider.of<UserModel>(context, listen: false);

  static bool get isLogin => user.token != null;

  static bool get isNotLogin => !isLogin;

  static void logoutAccount() {
    user.changed(user: UserModel());
  }

  static bool isLoginNotShowLoginDialog() {
    bool isLogin = Global.isLogin;
    if (!isLogin) {
      // todo 跳转到登录页面
//      LoginHelper.showLoginDialog(homeMainKey.currentContext);
    }
    return isLogin;
  }

  static Widget observeUser(Widget Function(UserModel) func) {
    return Consumer<UserModel>(builder: (context, user, _) {
      return func(user);
    });
  }
}