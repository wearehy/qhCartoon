import 'dart:convert';
import 'dart:io';
import 'package:baseflutterproject/c.dart';
import 'package:baseflutterproject/common.dart';
import 'package:baseflutterproject/model/db/user_model.dart';
import 'package:baseflutterproject/model/result_model.dart';
import 'package:dio/dio.dart';
import 'package:baseflutterproject/depositories/remote/http_request.dart';
import 'dart:ui' as ui;

import 'api.dart';

/// Data callback
class DC<T> {
  Function(T, ResultModel<T>) onSuccess;
  Function() onFinished;
  Function(int, String) onError;
  bool toastSuccess = false;
  DC({this.onFinished, this.onSuccess, this.onError, this.toastSuccess = false});
}


/// 放所有的网络请求
class HttpAction {
  static final HttpAction instance = HttpAction._privateConstructor();
  HttpAction._privateConstructor();

  /// 统一处理返回的数据
  _handle<T>(dynamic data, DC<T> dc, {int successCode, bool isReturn = false}) {
    if (dc.onFinished != null) {
      dc.onFinished();
    }
    if (data is DioError) {
      if (dc.onError != null) {
        dc.onError(0, data.message);
      }

      if (isReturn) {
        throw data.message;
      }
      return null;
    }
    try {
      final model = ResultModel<T>.fromJsonMap(jsonDecode(data));
      int code = model.code;
      if (code == CCNet.SUCCESS || successCode == code) {
        if (dc.onSuccess != null) {
          dc.onSuccess(model.data, model);
        }
        if (dc.toastSuccess) {
          toast(model.message);
        }
        return model.data;
      } else {
        toast(model.message);
        if (dc.onError != null) {
          dc.onError(code, model.message);
        }
      }
    } catch(e) {
      final em = '解析失败！请检查返回格式，或是否在modelFactories配置';
      if (dc.onError != null) {
        dc.onError(0, em);
      }
      if (isReturn) {
        throw em;
      }
    }
    return null;
  }

  registerByMobile(String mobile, String password, String smsCode, DC<UserModel> dc) async {
    _handle(await HttpRequest.instance.post(Api.REGISTER_BY_MOBILE, formParams: {
      'mobile': mobile,
      'password': hmacSha1(password),
      'code': smsCode
    }), dc);
  }

}

