
class CartoonIndexHomeList {

  int id;
  String thumb;
  String title;
  String desc;
  List<String> categories;
  String collect;

	CartoonIndexHomeList.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		thumb = map["thumb"],
		title = map["title"],
		desc = map["desc"],
		categories = List<String>.from(map["categories"]),
		collect = map["collect"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['thumb'] = thumb;
		data['title'] = title;
		data['desc'] = desc;
		data['categories'] = categories;
		data['collect'] = collect;
		return data;
	}
}
