import 'package:json_annotation/json_annotation.dart';
import 'package:ipfsnets/models/transfer_info_entiy.dart';

part 'transfer_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class TransferEntity {
	late num coinCode;
	late String coinIcon;
	late String coinName;
	late TransferInfoEntiy transferInfoVo;
	late num value;
	TransferEntity();
factory TransferEntity.fromJson(Map<String, dynamic> json) => _$TransferEntityFromJson(json);
Map<String, dynamic> toJson() => _$TransferEntityToJson(this);
}


