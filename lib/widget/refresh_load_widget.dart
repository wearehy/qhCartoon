
import '../depositories/remote/http_action.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshLoadWidget<T> extends StatefulWidget {

  final Function(int, DC<List<T>>) loadFuture;
  final Function() startRefresh;
  final Widget Function(BuildContext, int, List<T>) buildChild;
  final int Function(List<T>) itemCount;
  final double spaceItemHeight;
  final EdgeInsets padding;
  final Widget emptyWidget;
  final bool isGridView;
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const RefreshLoadWidget({
    Key key,
    @required this.loadFuture,
    this.startRefresh,
    @required this.buildChild,
    this.itemCount,
    this.spaceItemHeight = 0,
    this.padding,
    this.isGridView = false,
    this.childAspectRatio = 1,
    this.crossAxisCount = 1,
    this.mainAxisSpacing = 8,
    this.crossAxisSpacing = 8,
    this.emptyWidget}): super(key: key);

  @override
  _RefreshLoadWidgetState<T> createState() => _RefreshLoadWidgetState<T>();
}

class _RefreshLoadWidgetState<T> extends State<RefreshLoadWidget<T>> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  int _page = 1;
  List<T> dataList = [];
  var isFirst = true;

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  void _onRefresh() async {
    if (widget.startRefresh != null) {
      widget.startRefresh();
    }
    _loadData(1);
  }

  /// 加载数据
  void _loadData(int page) {

    if (_page == -1 && page != 1) { // 如果数据加载完了，就不加载了
      _refreshController.loadComplete();
      return;
    }

    _page = page;

    widget.loadFuture(page, DC<List<T>>(
      onFinished: () {
        isFirst = false;
        if (_refreshController.isRefresh) {
          _refreshController.refreshCompleted();
          _refreshController.loadComplete();
        }

        if (_refreshController.isLoading) {
          _refreshController.loadComplete();
        }
      },
      onSuccess: (data, model) {
        if (data == null) return;
        setState(() {
          if (page == 1) {
            dataList = data;
          } else {
            dataList.addAll(data);
            dataList = List.from(dataList);
          }

          if (model.total == dataList.length) {
            _refreshController.loadNoData();
            _page = -1;
          }
        });
      },
    ));
  }


  void _onLoading() async {
    if (mounted) setState(() {});
    _loadData(_page + 1);
  }


  @override
  Widget build(BuildContext context) {
    if ((dataList == null || dataList.isEmpty) && widget.emptyWidget != null) {
      if (isFirst) {
        return Center(child: CircularProgressIndicator(),);
      } else if (widget.emptyWidget != null) {
        return widget.emptyWidget;
      }
    }

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      footer: const ClassicFooter(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: widget.isGridView
          ? GridView.builder(itemCount: dataList.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.childAspectRatio,
        crossAxisSpacing: widget.crossAxisSpacing,
        mainAxisSpacing: widget.mainAxisSpacing,
      ), itemBuilder: (c, i) => widget.buildChild(c, i, dataList),
      padding: widget.padding == null ? EdgeInsets.all(0) : widget.padding,)
          : ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: widget.spaceItemHeight,
          );
        },
        padding: widget.padding == null ? EdgeInsets.fromLTRB(0, 0, 0, 0) : widget.padding,
        itemBuilder: (c, i) => widget.buildChild(c, i, dataList),
        itemCount: widget.itemCount == null ? dataList.length : widget.itemCount(dataList),
      ),
    );
  }

}