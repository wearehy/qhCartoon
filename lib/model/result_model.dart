import 'factories.dart';

class ResultModel<T> {
  int code;
  T data;
  String message;
  int currentPage;
  int pageSize;
  int pageCount;
  int total;

  ResultModel.fromJsonMap(Map<String, dynamic> map) {
    code = map["code"];
    if (map['data'] != null) {
      data = ModelFactory.instance.getFunc<T>()(map["data"]);
    }
    message = map["msg"];
    currentPage = map['currentPage'];
    pageCount = map['pageCount'];
    pageSize = map['pageSize'];
    total = map['total'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = new Map<String, dynamic>();
    result['code'] = code;
    result['data'] = data == null ? null : data is List ? (data as List).map((v) => v.toJson()).toList() : (data as dynamic).toJson();
    result['msg'] = message;
    return result;
  }


}
