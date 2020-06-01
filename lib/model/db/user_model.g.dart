// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel()
      ..id = fields[0] as int
      ..token = fields[1] as String
      ..username = fields[2] as String
      ..mobile = fields[3] as String
      ..idnumber = fields[4] as int
      ..avatar = fields[5] as String
      ..gender = fields[6] as int
      ..sign = fields[7] as String
      ..userStage = fields[8] as int
      ..qqId = fields[9] as String
      ..weixinId = fields[10] as String
      ..iosId = fields[11] as String
      ..exitPassword = fields[12] as int
      ..edc = fields[13] as String;
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.mobile)
      ..writeByte(4)
      ..write(obj.idnumber)
      ..writeByte(5)
      ..write(obj.avatar)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.sign)
      ..writeByte(8)
      ..write(obj.userStage)
      ..writeByte(9)
      ..write(obj.qqId)
      ..writeByte(10)
      ..write(obj.weixinId)
      ..writeByte(11)
      ..write(obj.iosId)
      ..writeByte(12)
      ..write(obj.exitPassword)
      ..writeByte(13)
      ..write(obj.edc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
