import 'package:json_annotation/json_annotation.dart';


part 'access_token_entity.g.dart';
@JsonSerializable()
class AccessTokenEntity  {

	@JsonKey(name: "access_token")
	String? accessToken;
	@JsonKey(name: "expires_in")
	int? expiresIn;

factory AccessTokenEntity.fromJson(Map<String, dynamic> json) => _$AccessTokenEntityFromJson(json);

Map<String, dynamic> toJson() => _$AccessTokenEntityToJson(this);

	AccessTokenEntity(this.accessToken, this.expiresIn);
}
