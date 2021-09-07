import 'package:json_annotation/json_annotation.dart';

import 'package:ipfsnets/models/home_earn_entity.dart';

part 'home_earns_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class HomeEarnsEntity{
	HomeEarnEntity? USDT;
	HomeEarnEntity? CNY;
	HomeEarnsEntity();


factory HomeEarnsEntity.fromJson(Map<String, dynamic> json) => _$HomeEarnsEntityFromJson(json);

Map<String, dynamic> toJson() => _$HomeEarnsEntityToJson(this);
}

