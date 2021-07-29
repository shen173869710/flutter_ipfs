import 'package:json_annotation/json_annotation.dart';

part 'wallet_item_entiy.g.dart';
@JsonSerializable()
class WalletItemEntiy{
  late num cny;
  late num coinCode;
  late String coinIcon;
  late String coinName;
  late num value;
  WalletItemEntiy();
  factory WalletItemEntiy.fromJson(Map<String, dynamic> json) => _$WalletItemEntiyFromJson(json);

  Map<String, dynamic> toJson() => _$WalletItemEntiyToJson(this);

}