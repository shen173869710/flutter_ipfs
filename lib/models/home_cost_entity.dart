import 'package:json_annotation/json_annotation.dart';

part 'home_cost_entity.g.dart';
@JsonSerializable()
class HomeCostEntity{
	late num totalCost;
	late num pledgeDay;
	late num gasDay;
	HomeCostEntity();



factory HomeCostEntity.fromJson(Map<String, dynamic> json) => _$HomeCostEntityFromJson(json);

Map<String, dynamic> toJson() => _$HomeCostEntityToJson(this);
}

