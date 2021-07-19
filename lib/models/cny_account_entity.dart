import 'package:json_annotation/json_annotation.dart';

part 'cny_account_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class CnyAccountEntity {

	num balance = 0;

factory CnyAccountEntity.fromJson(Map<String, dynamic> json) => _$CnyAccountEntityFromJson(json);

Map<String, dynamic> toJson() => _$CnyAccountEntityToJson(this);

	CnyAccountEntity();
}
