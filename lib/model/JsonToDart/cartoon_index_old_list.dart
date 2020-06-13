
import 'package:qhCartoon/model/JsonToDart/cartoon_index_old_list_categories.dart';

class CartoonIndexOldList {

  int id;
  String cate_id;
  String book_name;
  String pen_name;
  String book_desc;
  int book_vip;
  int book_isend;
  String book_thumb;
  String book_thumb2;
  int book_addtime;
  int book_updatetime;
  int app_show;
  int show;
  int book_chaptertime;
  int check_status;
  int view;
  int real_view;
  int book_status;
  String del_time;
  int collect;
  int type;
  String title;
  String thumb;
  String author;
  List<CartoonIndexOldListCategories> categories;

	CartoonIndexOldList.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		cate_id = map["cate_id"],
		book_name = map["book_name"],
		pen_name = map["pen_name"],
		book_desc = map["book_desc"],
		book_vip = map["book_vip"],
		book_isend = map["book_isend"],
		book_thumb = map["book_thumb"],
		book_thumb2 = map["book_thumb2"],
		book_addtime = map["book_addtime"],
		book_updatetime = map["book_updatetime"],
		app_show = map["app_show"],
		show = map["show"],
		book_chaptertime = map["book_chaptertime"],
		check_status = map["check_status"],
		view = map["view"],
		real_view = map["real_view"],
		book_status = map["book_status"],
		del_time = map["del_time"],
		collect = map["collect"],
		type = map["type"],
		title = map["title"],
		thumb = map["thumb"],
		author = map["author"];
//		categories = map["categories"] == null ? null : map["categories"].map((it) => CartoonIndexOldListCategories.fromJsonMap(it)).toList();

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['cate_id'] = cate_id;
		data['book_name'] = book_name;
		data['pen_name'] = pen_name;
		data['book_desc'] = book_desc;
		data['book_vip'] = book_vip;
		data['book_isend'] = book_isend;
		data['book_thumb'] = book_thumb;
		data['book_thumb2'] = book_thumb2;
		data['book_addtime'] = book_addtime;
		data['book_updatetime'] = book_updatetime;
		data['app_show'] = app_show;
		data['show'] = show;
		data['book_chaptertime'] = book_chaptertime;
		data['check_status'] = check_status;
		data['view'] = view;
		data['real_view'] = real_view;
		data['book_status'] = book_status;
		data['del_time'] = del_time;
		data['collect'] = collect;
		data['type'] = type;
		data['title'] = title;
		data['thumb'] = thumb;
		data['author'] = author;
		data['categories'] = categories;
		return data;
	}
}
