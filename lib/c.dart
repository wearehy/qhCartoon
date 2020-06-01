import 'dart:ui';

/// 正向
const C_POSITIVE = 1;

/// 反向
const C_NEGATIVE = 0;

/// 三方登录
class CCThirdLogin {
  static const QQ = 1;
  static const WX = 2;
  static const iOS = 3;
}

/// 性别
class CCSex {
  static const MAN = 1;
  static const WOMAN = 2;
}

///网页路径
class Html{
  static const CALCULATION = "https://mcfile.baoxiaobei.vip/edc.html";
}

/// 发送验证码类型 1普通，2注册，3登录，4所有信息变更类
class CCSMSType {
  static const NORMAL = 1;
  static const REGISTER = 2;
  static const LOGIN = 3;
  static const MODIFY = 4;
}

class CCNet {
  /// 成功
  static const SUCCESS = 200;
  static const SUCCESS_2005 = 2005;
}

class CCColor {
  static const primaryColor = Color(0xFFec5963);
  static const accentColor = Color(0xFFec5963);
  static const backgroundColor = Color(0xFFfafafa);

  /// 下划线颜色
  static const downLineColor = Color(0xFFF0F0F0);

  /// 字体主题颜色
  static const textColorPrimary = Color(0xFF444444);
  static const textColorSecondary = Color(0xFF999999);

  ///登录蒙版颜色
  static const loginBgColor = Color(0xB3000000);
  ///登录提示字体颜色
  static const loginHintTextColor = Color(0xff6c6c6c);
  ///登录的登录按钮背景颜色
  static const loginBgButtonColor = Color(0x806C6C6C);
  ///登录按钮颜色
  static const loginButtonColor = Color(0xffCCCCCC);
  //背景颜色
  static const backgroundGray = Color(0xffF0F0F0);

  static const textGray = Color(0xffA5A5A5);

}
