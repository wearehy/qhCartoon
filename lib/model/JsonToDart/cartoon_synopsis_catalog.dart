
class CartoonSynopsisCatalog {

  int id;
  int book_id;
  int volume_id;
  int idx;
  String title;
  Object chapter_thumb;
  int isvip;
  int price;
  int addtime;
  int updatetime;
  int check_status;
  int is_buy;
  String view;
  int status;
  int chapter_status;
  String del_time;
  int chapter_id;
  int work_id;
  Object thumb;
  int sum;
  int create_date;

	CartoonSynopsisCatalog.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		book_id = map["book_id"],
		volume_id = map["volume_id"],
		idx = map["idx"],
		title = map["title"],
		chapter_thumb = map["chapter_thumb"],
		isvip = map["isvip"],
		price = map["price"],
		addtime = map["addtime"],
		updatetime = map["updatetime"],
		check_status = map["check_status"],
		is_buy = map["is_buy"],
		view = '${map["view"]}',
		status = map["status"],
		chapter_status = map["chapter_status"],
		del_time = map["del_time"],
		chapter_id = map["chapter_id"],
		work_id = map["work_id"],
		thumb = map["thumb"],
		sum = map["sum"],
		create_date = map["create_date"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['book_id'] = book_id;
		data['volume_id'] = volume_id;
		data['idx'] = idx;
		data['title'] = title;
		data['chapter_thumb'] = chapter_thumb;
		data['isvip'] = isvip;
		data['price'] = price;
		data['addtime'] = addtime;
		data['updatetime'] = updatetime;
		data['check_status'] = check_status;
		data['is_buy'] = is_buy;
		data['view'] = view;
		data['status'] = status;
		data['chapter_status'] = chapter_status;
		data['del_time'] = del_time;
		data['chapter_id'] = chapter_id;
		data['work_id'] = work_id;
		data['thumb'] = thumb;
		data['sum'] = sum;
		data['create_date'] = create_date;
		return data;
	}
}
