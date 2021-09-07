import 'package:json_annotation/json_annotation.dart';

part 'home_earn_entity.g.dart';
@JsonSerializable()
class HomeEarnEntity{
	late num total;
	late num today;
	late num userRealCap;
	late num teamRealCap;
	HomeEarnEntity();


factory HomeEarnEntity.fromJson(Map<String, dynamic> json) => _$HomeEarnEntityFromJson(json);

Map<String, dynamic> toJson() => _$HomeEarnEntityToJson(this);
}

