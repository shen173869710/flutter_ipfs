import 'package:json_annotation/json_annotation.dart';


part 'user_entity.g.dart';
@JsonSerializable()
class UserEntity {
	int? userId;
	String? avatar;
	String? code;
	String? createBy;
	String? createTime;
	String? delFlag;
	int? level;
	String? nickname;
	String? password;
	String? ref;
	String? remark;
	String? searchValue;
	String? sex;
	String? status;
	String? updateBy;
	String? updateTime;
	String? username;

	UserEntity();

factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

