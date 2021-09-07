import 'package:json_annotation/json_annotation.dart';


part 'home_total_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class HomeTotalEntity{
	late num  total;
	late num  releaseNow;
	late num  freezeNum;
	HomeTotalEntity();



factory HomeTotalEntity.fromJson(Map<String, dynamic> json) => _$HomeTotalEntityFromJson(json);

Map<String, dynamic> toJson() => _$HomeTotalEntityToJson(this);
}

