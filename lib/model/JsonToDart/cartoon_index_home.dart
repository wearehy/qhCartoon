
import 'package:qhCartoon/model/JsonToDart/cartoon_index_home_list.dart';
import 'package:qhCartoon/model/factories.dart';

class CartoonIndexHome {

  String category;
  int style;
  int type;
  String icon;
  String pic_url;
  int jump_type;
  String web_url;
  int book_id;
  int chapter_id;
  List<CartoonIndexHomeList> list;

	CartoonIndexHome.fromJsonMap(Map<String, dynamic> map):
		category = map["category"],
		style = map["style"],
		type = map["type"],
		icon = map["icon"],
		pic_url = map["pic_url"],
		jump_type = map["jump_type"],
		web_url = map["web_url"],
		book_id = map["book_id"],
		chapter_id = map["chapter_id"],
		list  =			ModelFactory.instance.getFunc<List<CartoonIndexHomeList>>()(map["list"]);
//		list = List<CartoonIndexHomeList>.from(map["list"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['category'] = category;
		data['style'] = style;
		data['type'] = type;
		data['icon'] = icon;
		data['pic_url'] = pic_url;
		data['jump_type'] = jump_type;
		data['web_url'] = web_url;
		data['book_id'] = book_id;
		data['chapter_id'] = chapter_id;
		data['list'] = list;
		return data;
	}
}
