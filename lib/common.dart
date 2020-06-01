import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'c.dart';

bool isSoftKeyboardDisplay(MediaQueryData data) {
  return data.viewInsets.bottom / data.size.height > 0.3;
}


isEmpty(String text) {
  if (text == null) return true;
  return text.isEmpty;
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

bool checkPhone(String text) {
  if (text == null || text.trim().isEmpty) {
    BotToast.showText(text: '请输入手机号');
    return false;
  }
  return true;
}

String hmacSha1(String text) {
  final hmacSha1 = Hmac(sha1, utf8.encode('OT2NDh42'));
  return hmacSha1.convert(utf8.encode(text)).toString().toUpperCase();
}

BoxDecoration buildCircleShadowBG() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      boxShadow: [
        BoxShadow(color: Colors.grey[300], offset: Offset(0.1, 0.1), blurRadius: 16.0, spreadRadius: 2.0),
      ]
  );
}


BoxDecoration buildShadowBG({radius = 8.0}) {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      boxShadow: [
        BoxShadow(color: Colors.grey[300], offset: Offset(2.0, 2.0), blurRadius: 15.0, spreadRadius: 2.0),
      ]
  );
}

/// 线条统一构建
buildLine({double height = 0.6, double padding = 0}) {
  return Padding(padding: EdgeInsets.fromLTRB(padding, 0, padding, 0), child: Container(color: CCColor.downLineColor, height: height,),);
}

String formatDateString(DateTime time){
  return "${time.year}年${time.month}月${time.day}日";
}
String formatDataGang(DateTime time){
  return "${time.year}-${time.month < 10 ? ("0" + time.month.toString()):time.month}-${time.day < 10 ? ("0" + time.day.toString()):time.day}";
}

///// 统一构建TextFiled
//buildField(hint, controller, {reg, limitLen, enabled = true}) {
//  List<TextInputFormatter> list = List();
//  if (reg != null) {
//    list.add(WhitelistingTextInputFormatter(RegExp(reg)));
//  }
//  if (limitLen != null) {
//    list.add(LengthLimitingTextInputFormatter(limitLen));
//  }
//  return TextField(
//      controller: controller,
//      inputFormatters: list,
//      enabled: enabled,
//      decoration: InputDecoration(
//        border: InputBorder.none,
//        hintText: hint,
//      ),
//    );
//}

///// 构建有标题输入
//buildTitleField(title, hint, controller, {reg, limitLen, enabled = true, double titleSize = 50, double paddingStart = 0, double paddingEnd = 0}) {
//  return Row(
//    children: <Widget>[
//      SizedBox(width: paddingStart,),
//      Container(
//        width: titleSize,
//        child: Text(title, style: TextStyle(color: CCColor.textColorPrimary), ),
//      )
//      ,
//      Flexible(
//        child: buildField(hint, controller, reg: reg, limitLen: limitLen, enabled: enabled),
//      ),
//      SizedBox(width: paddingEnd,)
//    ],
//  );
//}

/// 长方形的成员头像
//Widget avatarWidgetRectangle(String thumb, {int sex = CCSex.WOMAN, BoxFit fit = BoxFit.fill, double width = double.infinity, double height = double.infinity, defaultMan = R.assetsImageMan, defaultWoman = R.assetsImageWoman, radius = 0}) {
//  final defaultImg =  Global.instance.isLogin?(sex ==CCSex.MAN ? defaultMan : defaultWoman):'assets/image/no_login_image.png';
//  try {
//    Widget widget = FadeInImage.assetNetwork(
//      placeholder:defaultImg,
//      fit: BoxFit.cover,
//      image: thumb,
//      width: width,
//      height: height,
//    );
//    if (radius == 0) {
//      return widget;
//    } else {
//      return ClipRRect(borderRadius: BorderRadius.all(Radius.circular(radius * 1.0)), child: widget,);
//    }
//  } catch (e) {
//    Widget widget = Image.asset(defaultImg, fit: fit, width: width, height: height,);
//    if (radius == 0) {
//      return widget;
//    } else {
//      return ClipRRect(borderRadius: BorderRadius.all(Radius.circular(radius * 1.0)), child: widget,);
//    }
//  }
//}
//
///// 正方形的人物头像
//Widget avatarWidgetSquare(String thumb, {int sex = CCSex.WOMAN, double size = 100, radius = 0}) {
//  return avatarWidgetRectangle(thumb, sex: sex, width: size, height: size, defaultMan: R.assetsImageIcDefaultHeadMan, defaultWoman: R.assetsImageIcDefaultHeadWoman, radius: radius);
//}
//
///// 圆形的人物头像
//Widget avatarWidgetCircle(String thumb, {int sex = CCSex.WOMAN, double size = 100}) {
//  return ClipOval(
//    child: avatarWidgetRectangle(thumb, sex: sex, width: size, height: size, defaultMan: R.assetsImageIcDefaultHeadManCircle, defaultWoman: R.assetsImageIcDefaultHeadWomanCircle),
//  );
//}
//
///// 家谱头像
//Widget loadGenealogyAvatar(String thumb, {int type = GENEALOGY_OWN, double width, double height}) {
//  final defaultImg = type == GENEALOGY_OWN ? R.assetsImageGenealogyPrivateIcon : R.assetsImageGenealogyPublicIcon;
//  try {
//    return ClipOval(
//      child: FadeInImage.assetNetwork(
//        placeholder:defaultImg,
//        image: thumb,
//        width: width,
//        height: height,
//        fit: BoxFit.fill,
//      )
//    );
//  } catch (e) {
//    return ClipOval(
//      child: Image.asset(defaultImg, width: width, height: height, fit: BoxFit.fill,),
//    );
//  }
//}

md5Text(String text) {
  var content = new Utf8Encoder().convert(text);
  var digest = md5.convert(content);
  // 这里其实就是 digest.toString()
  return hex.encode(digest.bytes);
}

toast(msg) {
  BotToast.showText(text: msg, borderRadius: const BorderRadius.all(Radius.circular(3)));
}

showLoading() {
  BotToast.showLoading();
}

closeLoading() {
  BotToast.closeAllLoading();
}

/// 是否是正式版
bool get isRelease => kReleaseMode;
/// 是否是测试模式
bool get isDebug => !isRelease;

logP(msg) {
  if (isRelease) {
    return;
  }
  print('💭$msg');
}
