import 'package:json_annotation/json_annotation.dart';

part 'market_bar_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class MarketBarEntity {
	late num typeId;
	late String name;
	MarketBarEntity();


factory MarketBarEntity.fromJson(Map<String, dynamic> json) => _$MarketBarEntityFromJson(json);

Map<String, dynamic> toJson() => _$MarketBarEntityToJson(this);
}


