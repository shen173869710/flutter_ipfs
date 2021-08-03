import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ipfsnets/models/transfer_info_entiy.dart';

part 'market_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class MarketEntity {
	late num contractPeriod;
	late String details;
	late num initial;
	late num machineId;
	late String name;
	late String nodeName;
	late num price;
	late String recommend;
	late num selled;
	late String shopStatus;
	late num stock;
	late List<String> tag;
	MarketEntity();

	factory MarketEntity.fromJson(Map<String, dynamic> json) => _$MarketEntityFromJson(json);

	Map<String, dynamic> toJson() => _$MarketEntityToJson(this);
}



