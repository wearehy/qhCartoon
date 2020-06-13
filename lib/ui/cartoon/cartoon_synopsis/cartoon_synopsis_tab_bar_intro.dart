import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qhCartoon/c.dart';
import 'package:qhCartoon/depositories/remote/http_action.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_like_list.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_intro.dart';
import 'package:qhCartoon/module/build_grid_view.dart';
import 'package:qhCartoon/module/build_grid_view_like.dart';
import 'package:qhCartoon/r.dart';

class CartoonSynopsisTabBarIntro extends StatefulWidget {
    @override
    CartoonSynopsisTabBarIntro({Key key, this.intro}) : super(key: key);
    CartoonSynopsisIntro intro;
    @override
    _CartoonSynopsisTabBarIntro createState() => _CartoonSynopsisTabBarIntro();
}


class _CartoonSynopsisTabBarIntro extends State<CartoonSynopsisTabBarIntro>{

  List<CartoonLikeList> _like;

  @override
  void initState(){
    super.initState();
    _getdata();
  }


  _getdata(){
    HttpAction.instance.cartoonLikeList(DC(
        onSuccess: (data,model){
          setState(() {
            _like = data;
          });
        }
    ));
  }

  @override
  Widget build(BuildContext context) {

    num miniSize = 9.0;
    return ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.topLeft,
                child: Text('作品简介',style: TextStyle(
                  fontSize: 10,

                ),)
              ),
              Container(                //作品简介
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 30),
                child: Text('${widget.intro.book_desc}',style: TextStyle(fontSize: miniSize),),
              ),
              Container(                //作者
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 10),
                child: Text('作者：${widget.intro.pen_name}',style: TextStyle(fontSize: miniSize),),
              ),
              Container(                //最新章节
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 10),
                child: Text('最新章节：${widget.intro.zxzj}',style: TextStyle(fontSize: miniSize,color: CCColor.primaryColor),),
              ),
              Container(                //人气值、已关注
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Row(
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.chessKing,size: miniSize,color: CCColor.primaryColor,),
                        Text('  ${widget.intro.view}',style: TextStyle(fontSize: miniSize),),
                      ],
                    )),
                    Expanded(child: Row(
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.check,size: miniSize,color:CCColor.yellow),
                        Text('  ${widget.intro.collect}',style: TextStyle(fontSize: miniSize),),
                      ],
                    )),
                  ],
                )
              ),
            ],
          ),
        ),

        ///猜你喜欢
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.cloud_circle,color: CCColor.primaryColor,size: 14,),
                  Text('猜你喜欢',style: TextStyle(fontSize: 12),)
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 5,),
        _like == null? Text('  ') :BuildGridViewLike(       //网格
          list: _like,
          crossAxisCount: 3,
          childAspectRatio: 3/5,
          aspectRatio: 210/277,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Image.asset(R.assetsImgResHomeBottomEnd,width: 120),
            )
        )
      ],
    );
  }
}