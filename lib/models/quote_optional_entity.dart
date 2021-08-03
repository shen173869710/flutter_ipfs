import 'package:json_annotation/json_annotation.dart';


part 'quote_optional_entity.g.dart';
@JsonSerializable()
class QuoteOptionalEntity {
	late num changeRate;
	late num id;
	late String logo;
	late num marketCap;
	late String name;
	late num priceCny;
	late num priceUsd;
	late num  star;
	QuoteOptionalEntity();

factory QuoteOptionalEntity.fromJson(Map<String, dynamic> json) => _$QuoteOptionalEntityFromJson(json);

Map<String, dynamic> toJson() => _$QuoteOptionalEntityToJson(this);
}
