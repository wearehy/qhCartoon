import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_index.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_synopsis.dart';
import 'package:qhCartoon/ui/cartoon/cartoon_synopsis/cartoon_synopsis_tab_bar.dart';

import '../common.dart';
import '../r.dart';
import 'package:flutter/material.dart';

class HomeMainPage extends StatefulWidget {

  HomeMainPage({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeMainPage> with AutomaticKeepAliveClientMixin {

  PageController _pageController;
  var index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: this.index);
  }

  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(child: PageView(
        children: <Widget>[
          CartoonIndex(),   //漫画
          CartoonSynopsis(),   //福利
          CartoonSynopsisTabBar()
        ],
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            this.index = page;
          });
        },
        physics: NeverScrollableScrollPhysics(),
      ), onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 3)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          toast('再按一次退出');
          return false;
        }
        return true;
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
//        showSelectedLabels: false,
//        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
//              icon: Image.asset(R.assetsImgHomeHomeNormal, width: 24, height: 24,),
//              activeIcon: Image.asset(R.assetsImgHomeHomeChecked, width: 24, height: 24,),
              icon: Image.asset(R.assetsImgHomeIcHomeComicNormal,width: 24, height: 24),
              activeIcon: Image.asset(R.assetsImgHomeIcHomeComicSelected, width: 24, height: 24,),
              title: const Text("漫画")
          ),
          BottomNavigationBarItem(
              icon: Image.asset(R.assetsImgHomeIcHomeBookshelfNormal, width: 24, height: 24,),
              activeIcon: Image.asset(R.assetsImgHomeIcHomeBookshelfSelected, width: 24, height: 24,),
              title: const Text("福利")
          ),
          BottomNavigationBarItem(
              icon: Image.asset(R.assetsImgHomeIcHomeMyselfNormal, width: 24, height: 24,),
              activeIcon: Image.asset(R.assetsImgHomeIcHomeMyselfSelected, width: 24, height: 24,),
              title: const Text("我的")
          ),
        ],
        currentIndex: index,
        onTap: (int index) {
          _pageController.jumpToPage(index);
//          _pageController.animateToPage(
//              index,
//              duration: const Duration(milliseconds: 100),
//              curve: Curves.ease);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
