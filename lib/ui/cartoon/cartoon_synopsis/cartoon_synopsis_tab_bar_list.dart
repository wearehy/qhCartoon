
import 'package:flutter/material.dart';
import 'package:qhCartoon/c.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_catalog.dart';

import 'package:qhCartoon/r.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_lists.dart';

class CartoonSynopsisTabBarList extends StatefulWidget {
  CartoonSynopsisTabBarList({Key key, this.list,this.cover}) : super(key: key);
  List<CartoonSynopsisCatalog> list;
  final String cover;

  @override
  _CartoonSynopsisTabBarList createState() => _CartoonSynopsisTabBarList();
}

class _CartoonSynopsisTabBarList extends State<CartoonSynopsisTabBarList> {
  bool orderBool = true;
  String orderText = '正序';
  String orderIcon = R.assetsImgMipmapXxhdpiIconOrder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[

              widget.list == null?Center(child: CircularProgressIndicator()):Container(
                margin: EdgeInsets.only(top: 45),
                child: ListView(reverse: !orderBool,padding: EdgeInsets.only(top: 0),
                  children: widget.list.map((x) => CartoonLists(cover: widget.cover,listM: x)).toList(),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.fromLTRB(0,10,10,10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2,color: CCColor.downLineColor)),
                    color: Colors.white
                ),
                child: Row(
                  children: <Widget>[
                    Text('专题列表',style: TextStyle(fontSize: 10),),
                    Expanded(child:Text('')),
                    GestureDetector(
                        onTap: () => {
                          orderBool = !orderBool,
                          setState((){
                            if(orderBool == true){

                              orderText = '正序';
                              orderIcon = R.assetsImgMipmapXxhdpiIconOrder;
                              print('${orderText}');
                            }else{
                              orderText = '倒序';
                              orderIcon = R.assetsImgMipmapXxhdpiIconOrderDao;
                              print('${orderText}');
                            }
                          })
                        },
                        child: Row(
                          children: <Widget>[
                            Text('${orderText} ',style: TextStyle(fontSize: 10),),
                            Image.asset(orderIcon,width: 12,height: 12,),
                          ] ,
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),

        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}