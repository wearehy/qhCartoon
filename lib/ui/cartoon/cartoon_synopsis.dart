import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qhCartoon/c.dart';
import 'package:qhCartoon/depositories/remote/http_action.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_catalog.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_intro.dart';
import 'package:qhCartoon/module/clip_img.dart';
import 'package:qhCartoon/module/project_app_bar.dart';
import 'package:qhCartoon/r.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_synopsis/cartoon_synopsis_tab_bar.dart';

class CartoonSynopsis extends StatefulWidget{
  CartoonSynopsis({Key key, this.title,this.work_id}) : super(key: key);
  final num work_id;
  final String title;
  @override
  _CartoonSynopsis createState() => _CartoonSynopsis();
}

class _CartoonSynopsis extends State<CartoonSynopsis> {
  @override
  CartoonSynopsisIntro _intro;
  List<CartoonSynopsisCatalog> _list;

  //滑动控制器
  ScrollController _controller;

  num _left = -35.0;
  num _bottom = 12.0;
  num _size = 8.0;
  @override
  void initState(){
    print('ssbbb${widget.work_id.toString()}');

    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        if(_controller.offset <= 0){
          _left = -35.0;
          _bottom = 12.0;
        }else if(_controller.offset>150){
          _left = 0.0;
          _bottom = 0.0;
        }else{
          _left   = (150-_controller.offset)*(-7/30);
          _bottom = (150-_controller.offset)*(2/25);
        }

      });
//      print('hy${_controller.offset}');
    });
    super.initState();
    _getdata();
  }


  /// 刷新
  @override
  Future<Null> _refresh() async {
    await _getdata();
  }

  _getdata(){
    HttpAction.instance.cartoonSynopsisIntro(widget.work_id,DC(
        onSuccess: (data,model){
          setState(() {
            _intro = data;
          });
        }
    ));
    HttpAction.instance.cartoonSynopsisCatalog(widget.work_id,DC(
        onSuccess: (data,model){
          setState(() {
            _list = data;
          });
        }
    ));
  }
  @override
  void dispose() {
    //销毁控制器
    _controller.dispose();
    super.dispose();
  }
  final Shader linearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Colors.yellow, Colors.greenAccent,Colors.blue,Colors.red],
  ).createShader(Rect.fromLTWH(40, 20, 60, 20));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _intro == null || _list == null  ? Center(child: CircularProgressIndicator()) : CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            backgroundColor: Colors.transparent,
//            leading: appBarBack(),
            pinned: true,
            expandedHeight: 200,
            actions: <Widget>[
              Transform.scale(
                scale: 0.8,
                child:  Chip(
                  padding: EdgeInsets.all(0),
                  avatar: Icon(Icons.add,color: Colors.black,),
                  label: Text('关注',style: TextStyle(fontWeight: FontWeight.w600),),
                  backgroundColor: CCColor.primaryColor,
                ),
              ),
            ],
            flexibleSpace:  FlexibleSpaceBar(
              title:  Container(
                  child:Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        left: _left,
                        bottom: _bottom,
                        child:  Text( '${_intro.book_name}' ,style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          foreground: Paint()..shader=linearGradient,
                        ),),
                      )

                    ],
                  )
              ),
              background: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,left: 0,bottom: 0,right: 0,
                    child: ClipImg(
                        img: _intro.book_thumb2,
                        height: 200,
                        placeholder: R.assetsImgResDefaultRectangle
                    ),
                  ),
                  Positioned(
                    top: 0,left: 0,bottom: 0,right: 0,
                    child:Image.asset(R.assetsImgResShade,fit: BoxFit.fill,),
                  ),
                  Positioned(
                    bottom: 6,
                    left: 20,right: 20,
                    child: Row(
                        children: <Widget>[] +  _intro.categories.map((x) =>
                            Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 1),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(9))
                                ),
                                child:Text(x,style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400,color: Colors.white),)
                            )

                        ).toList() + [
                          Expanded(child: Text('')),
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 1),
                              decoration: BoxDecoration(),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 2, 2, 0),
                                    child: Icon(Icons.remove_red_eye,size: 12,color: Colors.white,),
                                  ),
                                  Text(_intro.view.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),)
                                ],
                              )
                          )

                        ]

                    ),
                  ),
                ],
              ),

            ),
          ),
          //List

          SliverFillRemaining(
            child: CartoonSynopsisTabBar(intro: _intro,list: _list)

          ),

//          new SliverFixedExtentList(
//            itemExtent: 50.0,
//            delegate: new SliverChildBuilderDelegate(
//                    (BuildContext context, int index) {
//                  //创建列表项
//                  return new Container(
//                    alignment: Alignment.center,
//                    color: Colors.lightBlue[100 * (index % 9)],
//                    child: new Text(_controller.offset.toString()),
//                    height: 200,
//                  );
//                },
//                childCount: 50 //50个列表项
//            ),
//          ),
        ],
      ),
    );
  }
}
