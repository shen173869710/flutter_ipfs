import 'package:json_annotation/json_annotation.dart';
import 'home_cost_entity.dart';

part 'home_day_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class HomeDayEntity {
	HomeCostEntity? cost32;
	HomeCostEntity? costTB;
	HomeCostEntity? costPB;

factory HomeDayEntity.fromJson(Map<String, dynamic> json) => _$HomeDayEntityFromJson(json);

Map<String, dynamic> toJson() => _$HomeDayEntityToJson(this);

	HomeDayEntity();


}

