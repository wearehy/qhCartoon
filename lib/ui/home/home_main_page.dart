import '../../common.dart';
import '../../r.dart';
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
      backgroundColor: Colors.white,
      body: WillPopScope(child: PageView(
        children: <Widget>[
          Text("one"), // 页面一
          Text("two") //  页面二
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(R.assetsImgHomeHomeNormal, width: 24, height: 24,),
              activeIcon: Image.asset(R.assetsImgHomeHomeChecked, width: 24, height: 24,),
              title: const Text("首页")
          ),
          BottomNavigationBarItem(
              icon: Image.asset(R.assetsImgHomeMineNormal, width: 24, height: 24,),
              activeIcon: Image.asset(R.assetsImgHomeMineChecked, width: 24, height: 24,),
              title: const Text("我的")
          )
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
