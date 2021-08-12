import 'package:json_annotation/json_annotation.dart';


part 'user_entity.g.dart';
@JsonSerializable()
class UserEntity {
	late num userId;
	late String avatar;
	late num level;
	late String nickname;
	late String password;
	late String remark;
	late String searchValue;
	late String sex;
	late String status;
	late String username;
	
	late String code;
	late num ref;
	late String refname;
	late String refs;
	late num refLevels;

	UserEntity();

factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

