import 'package:json_annotation/json_annotation.dart';


part 'user_entity.g.dart';
@JsonSerializable()
class UserEntity {
	int? userId;
	String? avatar;
	int? level;
	String? nickname;
	String? password;
	String? remark;
	String? searchValue;
	String? sex;
	String? status;
	String? username;

	UserEntity();

factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

