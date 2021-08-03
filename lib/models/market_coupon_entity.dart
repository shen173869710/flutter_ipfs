import 'package:json_annotation/json_annotation.dart';

part 'market_coupon_entity.g.dart';
@JsonSerializable()
class MarketCouponEntity {
	late num couponId;
	late String faceValue;
	late num grantTime;
	late num pastTime;
	late num status;
	late String type;
	late num useTime;
	late num userId;
  MarketCouponEntity();

factory MarketCouponEntity.fromJson(Map<String, dynamic> json) => _$MarketCouponEntityFromJson(json);

Map<String, dynamic> toJson() => _$MarketCouponEntityToJson(this);
}
