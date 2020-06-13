
class CartoonIndexBanner {

  int work_id;
  int chapter_id;
  String title;
  String sub_title;
  String img_url;
  String thumb;
  int tag;
  String url;

	CartoonIndexBanner.fromJsonMap(Map<String, dynamic> map): 
		work_id = map["work_id"],
		chapter_id = map["chapter_id"],
		title = map["title"],
		sub_title = map["sub_title"],
		img_url = map["img_url"],
		thumb = map["thumb"],
		tag = map["tag"],
		url = map["url"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['work_id'] = work_id;
		data['chapter_id'] = chapter_id;
		data['title'] = title;
		data['sub_title'] = sub_title;
		data['img_url'] = img_url;
		data['thumb'] = thumb;
		data['tag'] = tag;
		data['url'] = url;
		return data;
	}

}
