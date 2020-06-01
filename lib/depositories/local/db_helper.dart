
import '../../model/db/user_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// 数据库帮助类
class DBHelper {


  /// 自己
  static const C_OWN = 'own';

  /// 怀孕期间宝宝数据
  static const C_BABY_INFO = 'baby_info';

  /// 宝宝成长数据
  static const C_BABY_GROWTH = 'baby_growth';

  /// 男宝宝头围
  static const C_BABY_HEAD_SIZE_BOY = 'baby_head_size_boy';

  /// 女宝宝头围
  static const C_BABY_HEAD_SIZE_GIRL = 'baby_head_size_girl';

  /// 男宝宝身高
  static const C_BABY_HEIGHT_BOY = 'baby_height_boy';

  /// 女宝宝身高
  static const C_BABY_HEIGHT_GIRL = 'baby_height_girl';

  /// 男宝宝体重
  static const C_BABY_WEIGHT_BOY = 'baby_weight_boy';

  /// 女宝宝体重
  static const C_BABY_WEIGHT_GIRL = 'baby_weight_girl';

  /// 宝宝列表
  static const C_BABY_LIST = 'baby_list';

  /// 初始化数据库
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
  }

  /// 获取用户信息
  static Future<UserModel> fetchUser() async {
    final userBox = await Hive.openBox<UserModel>('users');

    // 用户数据
    var user = userBox.get(C_OWN);
    if(user == null) {
      user = UserModel();
      userBox.put(C_OWN, user);
    }
    return user;
  }
}