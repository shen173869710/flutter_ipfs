// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_coupon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketCouponEntity _$MarketCouponEntityFromJson(Map<String, dynamic> json) {
  return MarketCouponEntity()
    ..couponId = json['couponId'] as num
    ..condition = json['condition'] as num
    ..name = json['name'] as String
    ..pastTime = json['pastTime'] as num
    ..status = json['status'] as num
    ..type = json['type'] as String
    ..faceValue = json['faceValue'] as num
    ..sel = json['sel'] as bool
    ..total = json['total'] as num;
}

Map<String, dynamic> _$MarketCouponEntityToJson(MarketCouponEntity instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'condition': instance.condition,
      'name': instance.name,
      'pastTime': instance.pastTime,
      'status': instance.status,
      'type': instance.type,
      'faceValue': instance.faceValue,
      'sel': instance.sel,
      'total': instance.total,
    };
