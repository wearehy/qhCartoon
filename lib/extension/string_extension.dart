import 'dart:convert';
import 'package:flutter/services.dart';
import '../common.dart';

extension StringExtension on String {

  /// 获取asset的html内容
  get assetHtmlContent async {
    String fileHtmlContents = await rootBundle.loadString(this);
    return Uri.dataFromString(fileHtmlContents, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString();
  }

  /// 检查验证码
  String get checkSMSCode {
    final t = this.trim();
    if (t.isEmpty) {
      toast('请输入验证码');
      return null;
    }
    return this;
  }

  /// 检查密码
  String get checkPwd {
    final t = this.trim();
    if (t.isEmpty) {
      toast('请输入密码');
      return null;
    }

    if (t.length < 6) {
      toast('请输入6位以上密码');
      return null;
    }
    return this;
  }

  /// 检测手机号
  String get checkPhone {
    final t = this.trim();
    if (t.isEmpty) {
      toast('请输入手机号');
      return null;
    }

    if (t.length < 11) {
      toast('请检查手机号');
      return null;
    }
    return this;
  }
}