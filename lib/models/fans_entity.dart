import 'package:json_annotation/json_annotation.dart';

part 'fans_entity.g.dart';
@JsonSerializable()
class FansEntity {
	late String avatar;
	late String createTime;
	late String levelName;
	late String nickname;
	late num personalKpi;
	late num teamKpi;
	FansEntity();


factory FansEntity.fromJson(Map<String, dynamic> json) => _$FansEntityFromJson(json);

Map<String, dynamic> toJson() => _$FansEntityToJson(this);
}
