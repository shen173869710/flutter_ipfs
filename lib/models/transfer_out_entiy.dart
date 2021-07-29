import 'package:json_annotation/json_annotation.dart';


part 'transfer_out_entiy.g.dart';
@JsonSerializable()
class TransferOutEntiy{
  late String coinName;
  late num gas;
  late num transferGasType;
  TransferOutEntiy();
  factory TransferOutEntiy.fromJson(Map<String, dynamic> json) => _$TransferOutEntiyFromJson(json);
  Map<String, dynamic> toJson() => _$TransferOutEntiyToJson(this);
}



