

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'package:qhCartoon/c.dart';
import 'package:qhCartoon/depositories/remote/http_action.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_banner.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_home.dart';
import 'package:qhCartoon/module/build_grid_view.dart';
import 'package:qhCartoon/module/clip_img.dart';
import 'package:qhCartoon/extension/build_context_extension.dart';


import 'package:qhCartoon/r.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_synopsis.dart';



class CartoonIndex extends StatefulWidget {
  CartoonIndex({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CartoonIndex createState() => _CartoonIndex();
}

class _CartoonIndex extends State<CartoonIndex> {

  List<CartoonIndexBanner> _banner;
  List<CartoonIndexHome>  _list;



  @override
  void initState(){
    super.initState();
    _getdata();
  }
  /// 刷新
  @override
  Future<Null> _refresh() async {
    await _getdata();
  }
  @override
  _getdata(){
    HttpAction.instance.cartoonIndexBanner(DC(
        onSuccess: (data, model) {
          setState(() {
            _banner = data;
          });
        }
    ));
    HttpAction.instance.cartoonIndexHome(DC(
        onSuccess: (data, model) {
          setState(() {
            _list = data;
          });
        }
    ));
  }

  @override
  Widget build(BuildContext context) {

    Container buildBannerDot(Color color){        //banner 圆点
      return new Container(
        width: 8, height: 8,margin: EdgeInsets.symmetric(vertical:20,horizontal:2),
        decoration: BoxDecoration(
          shape:BoxShape.circle,
          color: color,
        ) ,
      );
    }

    Column buildNav(String img,String name,String url){    //导航图标
      return Column(
        children: <Widget>[
          GestureDetector(
            child: Image.asset(
              img,
              width: 55,
              height: 55,
            ),
            onTap: (){ //导航栏点击跳转
              print('hhyy$_list');
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child:Text(name,style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w300,

            )),
          ),

        ],
      );
    }


    ///标题
    Container buildTitle(e){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
        child:  Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 3),
              child:  Image.network(e.icon,width: 14,height: 14),
            ),
            Text(e.category,style: TextStyle(
                fontSize: 12
            ),),
            Expanded(
              child: Text(''),
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text('更多',style: TextStyle(fontWeight: FontWeight.w100,fontSize: 10),),
                  Icon(Icons.arrow_forward_ios,size: 14,)
                ],
              ),
            ),
          ],
        )
      );
    }

    //一排3列
    Column row3(CartoonIndexHome opt){

      return Column(
          children: <Widget>[
            buildTitle(opt),
            BuildGridView(
              list:  opt.list,
              crossAxisCount: 3,
              childAspectRatio: 3/5,
              aspectRatio: 210/277,
            ),
          ]
      );
    }
    //一排2列
    Column row2(CartoonIndexHome opt){
      return Column(
          children: <Widget>[
            buildTitle(opt),
            BuildGridView(
              list: opt.list,
              crossAxisCount: 2,
              childAspectRatio: 5/4.2,
              aspectRatio: 5/3,
            ),
          ]
      );
    }
    //一排1列
    Column row1(CartoonIndexHome opt){

      return Column(
        children: <Widget>[
          Container(
            ///left,top,right,bottom
            padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: ClipImg(img: opt.pic_url,aspectRatio: 1036/340,radius: 5,)
          )
        ],
      );

    }
    ///标题+网格
    Column buildContainer(CartoonIndexHome opt){
      num opts = opt.style;

      return opts == 3?row3(opt):(opts == 2?row2(opt):(opts == 4?row1(opt):Column()));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body:  _banner == null || _list == null  ? Center(child: CircularProgressIndicator()/**页面转圈***/,) : RefreshIndicator(
          onRefresh: _refresh,
          child: ListView(
              padding: EdgeInsets.only(top: 0),
              //children: _banner.map((e) => Text(e.title)).toList()
              children:<Widget>[
                //banner + nav
                Container(
                  height: 280,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          BannerSwiper(
                            //width  和 height 是图片的高宽比  不用传具体的高宽   必传
                            height: 750,
                            width: 469,
                            //轮播图数目 必传
                            length: _banner.length,
                            //图片间是否有间隔
                            spaceMode: false,
                            //轮播的item  widget 必传
                            getwidget: (index) {
                              return new GestureDetector(
                                  //child: FadeInImage.assetNetwork(placeholder: R.assetsImgResDefaultRectangle, image: _banner[index % _banner.length].thumb,fit: BoxFit.cover),
                                  child: ClipImg(img: _banner[index % _banner.length].thumb,height: 200,radius: 5,placeholder: R.assetsImgResDefaultRectangle),
                                  onTap: () {
                                    context.pushPage(CartoonSynopsis(work_id: _banner[index % _banner.length].work_id,));
                                  }
                                );
                            },
                            normalWidget:   buildBannerDot(Colors.white),
                            selectorWidget: buildBannerDot(CCColor.primaryColor),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Image.asset(R.assetsImgResIcBannerArc),
                          ),   //banner 底部弧形
                          /// 搜索
                          Positioned(
                            right: 30,
                            top: 30,
                            child: GestureDetector(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: Stack(
                                  children: <Widget>[
                                    Opacity(
                                      opacity: 0.5,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: 0.8,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        child: Icon(Icons.search,color: Colors.white,size: 30),
                                      ),
                                    ),
                                  ],
                                )
                              )

                            ),
                          ),

                        ],
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              buildNav(R.assetsImgResHomeFree,'免费','url'),
                              buildNav(R.assetsImgResHomeUpdate,'福利','url'),
                              buildNav(R.assetsImgResHomeHot,'热门','url'),
                              buildNav(R.assetsImgResHomeCategory,'分类','url'),
                            ],
                          )
                      ),
                    ],
                  ),
                ),

                //网格

              ] + _list.map((CartoonIndexHome opt) => buildContainer(opt)).toList() + [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Image.asset(R.assetsImgResHomeBottomEnd,width: 120),
                    )
                )
              ],
            ),
        )
         // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

