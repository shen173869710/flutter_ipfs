import 'package:json_annotation/json_annotation.dart';

part 'market_coupon_entity.g.dart';
@JsonSerializable()
class MarketCouponEntity {
	late num couponId = 0;
	// 使用条件
	late String condition;
	// 名称
	late String name = "";
	// 过期时间
	late num pastTime;
	late num status;
	late String type;

	late bool sel = false;
	// late num useTime;
	// late num userId;
  MarketCouponEntity();

factory MarketCouponEntity.fromJson(Map<String, dynamic> json) => _$MarketCouponEntityFromJson(json);

Map<String, dynamic> toJson() => _$MarketCouponEntityToJson(this);
}
