import 'dart:convert';
import 'dart:io';
import 'package:qhCartoon/c.dart';
import 'package:qhCartoon/common.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_banner.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_home.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_old.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_old_list.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_old_list_categories.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_like_list.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_catalog.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_intro.dart';


import 'package:qhCartoon/model/db/user_model.dart';
import 'package:qhCartoon/model/result_model.dart';
import 'package:dio/dio.dart';
import 'package:qhCartoon/depositories/remote/http_request.dart';
import 'package:qhCartoon/model/result_model.dart';
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


    ///  请求
    //    registerByMobile(String mobile, String password, String smsCode, DC<UserModel> dc) async {
    //      _handle(await HttpRequest.instance.post(Api.REGISTER_BY_MOBILE, formParams: {
    //        'mobile': mobile,
    //        'password': hmacSha1(password),
    //        'code': smsCode
    //      }), dc);
    //    }

    //    CartoonIndexOld(DC<CartoonIndexOld> dc) async {
    //      _handle(await HttpRequest.instance.get(Api.HOME_RECOMMEND), dc);
    //    }

    ///漫画首页
    //轮播
    cartoonIndexBanner(DC<List<CartoonIndexBanner>> dc) async {
      _handle(await HttpRequest.instance.get(Api.INDEX_BANNER), dc);
    }
    //主体内容
    cartoonIndexHome(DC<List<CartoonIndexHome>> dc) async {
      _handle(await HttpRequest.instance.get(Api.HOME_RECOM2), dc);
    }

    ///漫画大纲
    //简介
    cartoonSynopsisIntro(int work_id,DC<CartoonSynopsisIntro> dc) async {
      _handle(await HttpRequest.instance.get(Api.COMIC_INFO,queryParams:{
       'work_id': work_id
      }), dc);
    }
    //目录
    cartoonSynopsisCatalog(int work_id,DC<List<CartoonSynopsisCatalog>> dc) async {
      _handle(await HttpRequest.instance.get(Api.CHAPTER_LIST,queryParams: {
        'work_id': work_id
      }), dc);
    }
    //猜你喜欢
    cartoonLikeList(DC<List<CartoonLikeList>> dc) async {
      _handle(await HttpRequest.instance.get(Api.V2_DT_LIKELIST), dc);
    }
}


