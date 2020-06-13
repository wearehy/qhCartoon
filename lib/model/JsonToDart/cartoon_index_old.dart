
import 'package:qhCartoon/model/JsonToDart/cartoon_index_old_list.dart';
import 'package:qhCartoon/model/factories.dart';

class CartoonIndexOld {

  List<CartoonIndexOldList> main;
  List<CartoonIndexOldList> optimal;
  List<CartoonIndexOldList> fine;

	CartoonIndexOld.fromJsonMap(Map<String, dynamic> map):
		main = ModelFactory.instance.getFunc<List<CartoonIndexOldList>>()(map["main"]),
		optimal = ModelFactory.instance.getFunc<List<CartoonIndexOldList>>()(map["optimal"]),
		fine = ModelFactory.instance.getFunc<List<CartoonIndexOldList>>()(map["fine"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['main'] = main;
		data['optimal'] = optimal;
		data['fine'] = fine;
		return data;
	}
}
