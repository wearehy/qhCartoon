
class CartoonLikeList {

  int id;
  String cate_id;
  String title;
  String thumb;
  String book_desc;
  int collect;
  List<String> categories;
  String desc;

	CartoonLikeList.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		cate_id = map["cate_id"],
		title = map["title"],
		thumb = map["thumb"],
		book_desc = map["book_desc"],
		collect = map["collect"],
		categories = List<String>.from(map["categories"]),
		desc = map["desc"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['cate_id'] = cate_id;
		data['title'] = title;
		data['thumb'] = thumb;
		data['book_desc'] = book_desc;
		data['collect'] = collect;
		data['categories'] = categories;
		data['desc'] = desc;
		return data;
	}
}
