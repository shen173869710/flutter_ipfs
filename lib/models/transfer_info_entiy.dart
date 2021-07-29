import 'package:ipfsnets/models/transfer_in_entiy.dart';
import 'package:ipfsnets/models/transfer_out_entiy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_info_entiy.g.dart';
@JsonSerializable(explicitToJson: true)
class TransferInfoEntiy{
	late TransferInEntiy transferIn;
	late TransferOutEntiy transferOut;

	TransferInfoEntiy();
factory TransferInfoEntiy.fromJson(Map<String, dynamic> json) => _$TransferInfoEntiyFromJson(json);

Map<String, dynamic> toJson() => _$TransferInfoEntiyToJson(this);
}



