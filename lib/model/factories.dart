

import 'package:qhCartoon/model/JsonToDart/cartoon_index_banner.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_home.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_home_list.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_like_list.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_catalog.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_intro.dart';




import 'db/user_model.dart';

class ModelFactory {
  static final ModelFactory instance = ModelFactory._privateConstructor();
  final _modelFactories = Map<Type, Function>();
  getFunc<T>() => _modelFactories[T];
  void _add2Fac<T>(Function function) {
    _modelFactories[T] = function;
  }
  ModelFactory._privateConstructor() {
    _add2Fac<String>((String s) => s);
    _add2Fac<UserModel>((Map<String, dynamic> map) => UserModel.fromJsonMap(map));

    ///旧漫画首页列表
    //_add2Fac<CartoonIndexOld>((Map<String, dynamic> map) => CartoonIndexOld.fromJsonMap(map));
    //_add2Fac<List<CartoonIndexOldList>>((List list) => (list.map((it) => CartoonIndexOldList.fromJsonMap(it))).toList());
    //_add2Fac<List<CartoonIndexOldListCategories>>((List list) => (list.map((it) => CartoonIndexOldListCategories.fromJsonMap(it))).toList());

    ///漫画首页
    //轮播
    _add2Fac<List<CartoonIndexBanner>>((List list) => (list.map((it) => CartoonIndexBanner.fromJsonMap(it))).toList());
    //列表
    _add2Fac<List<CartoonIndexHome>>((List list) => (list.map((it) => CartoonIndexHome.fromJsonMap(it))).toList());
    _add2Fac<List<CartoonIndexHomeList>>((List list) => (list.map((it) => CartoonIndexHomeList.fromJsonMap(it))).toList());

    ///漫画大纲
    //简介
    _add2Fac<CartoonSynopsisIntro>((Map<String, dynamic> map) => CartoonSynopsisIntro.fromJsonMap(map));
    //目录
    _add2Fac<List<CartoonSynopsisCatalog>>((List list) => (list.map((it) => CartoonSynopsisCatalog.fromJsonMap(it))).toList());
    //猜你喜欢
    _add2Fac<List<CartoonLikeList>>((List list) => (list.map((it) => CartoonLikeList.fromJsonMap(it))).toList());

  }

}
