import 'package:json_annotation/json_annotation.dart';



part 'cny_withdrawal_setting_entity.g.dart';
@JsonSerializable()
class CnyWithdrawalSettingEntity{
  CnyWithdrawalSettingEntity();
  late num conversion;
  late num id;
  late num minAmount;
  late String remarks;
  late num serviceChargeType;
  late num serviceChargeValue;

  init(){
    conversion = 0;
    id = 0;
    minAmount = 0;
    remarks = "";
    serviceChargeType = 0;
    serviceChargeValue = 0;
  }

factory CnyWithdrawalSettingEntity.fromJson(Map<String, dynamic> json) => _$CnyWithdrawalSettingEntityFromJson(json);

Map<String, dynamic> toJson() => _$CnyWithdrawalSettingEntityToJson(this);

}