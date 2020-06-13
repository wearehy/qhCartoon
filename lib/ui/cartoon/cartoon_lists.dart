

import 'package:flutter/material.dart';
import 'package:qhCartoon/c.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_catalog.dart';
import 'package:qhCartoon/module/timer.dart';
import 'package:qhCartoon/r.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_index_old_list_categories.dart';

class CartoonLists extends StatefulWidget {
  CartoonLists({Key key, this.cover,this.listM}) : super(key: key);
  final listM;
  final String cover;

  @override
  _CartoonLists createState() => _CartoonLists();
}

class _CartoonLists extends State<CartoonLists> {

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1 ,color: CCColor.downLineColor), ),
      ),
      child: AspectRatio(
        aspectRatio: 750/469,
        child:  Row(
          children: <Widget>[
            FadeInImage.assetNetwork(placeholder: R.assetsImgResDefaultRectangle, image: widget.cover,fit: BoxFit.cover,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${widget.listM.title}',style: TextStyle(fontSize: 10),),
                    Expanded(child:Text('')),
                    Text('${timer_date(widget.listM.create_date)}',style: TextStyle(fontSize: 10), )
                  ],
                ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: 50,
              child: Column(
                children: <Widget>[
                  Expanded(child: Text('')),
                  Row(
                    children: <Widget>[
                      Icon(Icons.remove_red_eye,size: 12,),
                      SizedBox(width: 1),
                      Text(widget.listM.view,style: TextStyle(fontSize: 10),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )

    );
  }
}