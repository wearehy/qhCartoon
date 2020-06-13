
class CartoonSynopsisIntro {

  int id;
  String book_name;
  String book_thumb;
  String book_thumb2;
  String cate_id;
  String book_desc;
  String pen_name;
  String view;
  String collect;
  List<String> categories;
  int have_content_thumb;
  String zxzj;

	CartoonSynopsisIntro.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		book_name = map["book_name"],
		book_thumb = map["book_thumb"],
		book_thumb2 = map["book_thumb2"],
		cate_id = map["cate_id"],
		book_desc = map["book_desc"],
		pen_name = map["pen_name"],
		view = '${map["view"]}',
		collect = '${map["collect"]}',
		categories = List<String>.from(map["categories"]),
		have_content_thumb = map["have_content_thumb"],
		zxzj = map["zxzj"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['book_name'] = book_name;
		data['book_thumb'] = book_thumb;
		data['book_thumb2'] = book_thumb2;
		data['cate_id'] = cate_id;
		data['book_desc'] = book_desc;
		data['pen_name'] = pen_name;
		data['view'] = view;
		data['collect'] = collect;
		data['categories'] = categories;
		data['have_content_thumb'] = have_content_thumb;
		data['zxzj'] = zxzj;
		return data;
	}
}
