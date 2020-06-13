//import 'dart:convert';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_home.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_home_list.dart';
import 'package:qhCartoon/module/clip_img.dart';
import 'package:qhCartoon/r.dart';
import 'package:qhCartoon/extension/build_context_extension.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_synopsis.dart';

class BuildGridView extends StatelessWidget {

  BuildGridView({
    Key key,
    //JSON数据
    this.list,
    //网格每排图片数量  3
    this.crossAxisCount,
    //网格宽高比例  3/5
    this.childAspectRatio,
    //网格内图片 宽高比例  210/277 5/3
    this.aspectRatio,
  }) : super(key: key);

  ///JSON数据
  final List list;
  ///网格每排图片数量  3
  final int crossAxisCount;
  ///网格宽高比例  3/5
  final double childAspectRatio;
  ///网格内图片 宽高比例  210/277 5/3
  final double aspectRatio;


  @override
  Widget build(BuildContext context) {

    Container buildCategoriesText(x){
      return Container(
        child:  Row(
          children: <Widget>[
            Text(
              x,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w100,
                  color: Colors.black54),
            ),
            ///间隔
            SizedBox(width: 5,),
          ],
        ),
      );
    }

    Container buildGridViewChild(CartoonIndexHomeList e, aspectRatio) {
      //网格子组件
      return Container(
        alignment: Alignment(0, -1),
        child: GestureDetector(
          onTap: () => {
            print(e.id),
            context.pushPage(CartoonSynopsis(work_id: e.id,))
          },
          child: Column(
            children: <Widget>[
              Container(
                  child: Stack(
                    children: <Widget>[
                      ClipImg(img: e.thumb, aspectRatio: aspectRatio,placeholder: R.assetsImgResDefaultSquare,radius: 5,),
                      //遮罩
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                            child: Image.asset(R.assetsImgResShade,height: 20,fit: BoxFit.fill,),
                          )
                      ),

                      //关注
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            child: Text('${e.collect}关注',
                                style: TextStyle(fontSize: 8, color: Colors.white)),
                          )),

                    ],
                  )),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    e.title,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: e.categories.map(
                              (x) => buildCategoriesText(x)
                      ).toList(),
                    )
                ),
              )
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(0),
      child: GridView.count(
        ///高度自适应
        shrinkWrap: true,
        //阻止网格内部滑动
        physics: NeverScrollableScrollPhysics(),
        ///宽高比
        childAspectRatio: childAspectRatio,
        ///每排数量
        crossAxisCount: crossAxisCount,

        ///GridView 边界左右空隙
        padding: EdgeInsets.symmetric(horizontal: 5),
        ///子组件左右空隙（不包括和边界空隙）
        crossAxisSpacing: 5,
        ///子组件上下空隙
        mainAxisSpacing: 5,

        children: list.map((e) => buildGridViewChild(e, aspectRatio)).toList(),
      ),
    );
  }
}
