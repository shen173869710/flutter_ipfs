import 'package:json_annotation/json_annotation.dart';


part 'market_buy_entity.g.dart';
@JsonSerializable()
class MarketBuyEntity {
	late num cnyBalance = 0;
	late num cnyPrice = 0;

	late num usdtBalance = 0;
	late num usdtPrice = 0;

	MarketBuyEntity();




  factory MarketBuyEntity.fromJson(Map<String, dynamic> json) => _$MarketBuyEntityFromJson(json);

Map<String, dynamic> toJson() => _$MarketBuyEntityToJson(this);
}



