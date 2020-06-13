import 'package:flutter/material.dart';
import 'package:qhCartoon/c.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_catalog.dart';
import 'package:qhCartoon/model/JsonToDart/cartoon_synopsis_intro.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_synopsis/cartoon_synopsis_tab_bar_intro.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_synopsis/cartoon_synopsis_tab_bar_list.dart';


class CartoonSynopsisTabBar extends StatelessWidget {

  CartoonSynopsisTabBar({Key key,this.list,this.intro}) : super(key: key);

  final List<CartoonSynopsisCatalog> list;
  final CartoonSynopsisIntro intro;


  @override
  Widget build(BuildContext context) {
    return  new DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: CCColor.backgroundGray
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(          ///TabBar嵌入body -> title 消除顶部title
                        child: TabBar(
                          //isScrollable: true,
                          tabs: <Widget>[
                            Tab(text:'简介'),
                            Tab(text:'目录'),
                          ],
                          indicatorColor: CCColor.primaryColor
                        )
                    ),
                  ],
                ),
                height: 50,
              ),
               Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: TabBarView(
                    children: <Widget>[
                      CartoonSynopsisTabBarIntro(intro:intro),
                      CartoonSynopsisTabBarList(cover:  intro.book_thumb2,list:list)
                    ],
                  ),
                ),

            ],
          )
        ),

    );
  }
}


