
class CartoonIndexOldListCategories {

  int id;
  String name;
  int parentid;
  int orders;
  String keywords;
  String desc;
  int status;

	CartoonIndexOldListCategories.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		name = map["name"],
		parentid = map["parentid"],
		orders = map["orders"],
		keywords = map["keywords"],
		desc = map["desc"],
		status = map["status"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['parentid'] = parentid;
		data['orders'] = orders;
		data['keywords'] = keywords;
		data['desc'] = desc;
		data['status'] = status;
		return data;
	}
}
