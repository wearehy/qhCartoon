import '../../c.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1, adapterName: 'UserAdapter')
class UserModel extends HiveObject with ChangeNotifier {
  @HiveField(0)
  int id;
  @HiveField(1)
  String token;
  @HiveField(2)
  String username;
  @HiveField(3)
  String mobile;
  @HiveField(4)
  int idnumber;
  @HiveField(5)
  String avatar;
  @HiveField(6)
  int gender;
  @HiveField(7)
  String sign;
  @HiveField(8)
  int userStage;
  @HiveField(9)
  String qqId;
  @HiveField(10)
  String weixinId;
  @HiveField(11)
  String iosId;
  @HiveField(12)
  int exitPassword;
  @HiveField(13)
  String edc;

  UserModel();

  UserModel.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        token = map["token"],
        username = map["username"],
        mobile = map["mobile"],
        idnumber = map["idnumber"],
        avatar = map["avatar"],
        gender = map["gender"],
        sign = map["sign"],
        userStage = map["user_stage"],
        qqId = map["qq_id"],
        weixinId = map["weixin_id"],
        iosId = map["ios_id"],
        edc = map["edc"],
        exitPassword = map["exit_password"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['token'] = token;
    data['username'] = username;
    data['mobile'] = mobile;
    data['idnumber'] = idnumber;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['sign'] = sign;
    data['user_stage'] = userStage;
    data['qq_id'] = qqId;
    data['weixin_id'] = weixinId;
    data['edc'] = edc;
    data['ios_id'] = iosId;
    data['exit_password'] = exitPassword;
    return data;
  }
  
  bool get isWoman => gender == CCSex.WOMAN; 

  /// 已改变
  void changed({username, mobile, avatar, gender, sign,  UserModel user, qqId, weixinId, userStage, edc, iosId}) {
    if (user != null) {
      this.id = user.id;
      this.token = user.token;
      this.username = user.username;
      this.mobile = user.mobile;
      this.idnumber = user.idnumber;
      this.avatar = user.avatar;
      this.gender = user.gender;
      this.sign = user.sign;
      this.userStage = user.userStage;
      this.qqId = user.qqId;
      this.weixinId = user.weixinId;
      this.iosId = user.iosId;
      this.exitPassword = user.exitPassword;
      notifyListeners();
      save();
      return;
    }
    if (qqId != null)
      this.qqId = qqId;
    if (weixinId != null)
      this.weixinId = weixinId;
    if (iosId != null)
      this.iosId = iosId;
    if (username != null)
      this.username = username;
    if (mobile != null)
      this.mobile = mobile;
    if (userStage != null)
      this.userStage = userStage;
    if (edc != null)
      this.edc = edc;
    if (avatar != null)
      this.avatar = avatar;
    if (gender != null)
      this.gender = gender;
    if (sign != null)
      this.sign = sign;
    notifyListeners();
    save();
  }

}