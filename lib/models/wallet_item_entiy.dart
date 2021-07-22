import 'package:json_annotation/json_annotation.dart';

part 'wallet_item_entiy.g.dart';
@JsonSerializable()
class WalletItemEntiy{
  num cny;
  num coinCode;
  String coinIcon;
  String coinName;
  num value;

factory WalletItemEntiy.fromJson(Map<String, dynamic> json) => _$WalletItemEntiyFromJson(json);

  Map<String, dynamic> toJson() => _$WalletItemEntiyToJson(this);

  WalletItemEntiy(this.cny, this.coinCode, this.coinIcon, this.coinName, this.value);
}