import 'package:json_annotation/json_annotation.dart';




import 'package:ipfsnets/models/home_day_entity.dart';
import 'package:ipfsnets/models/home_earns_entity.dart';
import 'package:ipfsnets/models/home_total_entity.dart';

part 'home_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class HomeEntity {
	HomeDayEntity? oneDayCost;
	HomeTotalEntity? totalEarnings;
	HomeEarnsEntity? earningsView;
	HomeEntity();
factory HomeEntity.fromJson(Map<String, dynamic> json) => _$HomeEntityFromJson(json);
Map<String, dynamic> toJson() => _$HomeEntityToJson(this);
}


