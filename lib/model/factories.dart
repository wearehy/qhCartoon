import 'db/user_model.dart';

class ModelFactory {
  static final ModelFactory instance = ModelFactory._privateConstructor();
  final _modelFactories = Map<Type, Function>();
  getFunc<T>() => _modelFactories[T];
  void _add2Fac<T>(Function function) {
    _modelFactories[T] = function;
  }
  ModelFactory._privateConstructor() {
    _add2Fac<String>((String s) => s);
    _add2Fac<UserModel>((Map<String, dynamic> map) => UserModel.fromJsonMap(map));
  }

}
