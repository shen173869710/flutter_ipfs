import 'package:json_annotation/json_annotation.dart';

part 'transfer_in_entiy.g.dart';
@JsonSerializable()
class TransferInEntiy{
  late num coinCode;
  late String coinName;
  late String username;
  TransferInEntiy();
factory TransferInEntiy.fromJson(Map<String, dynamic> json) => _$TransferInEntiyFromJson(json);

Map<String, dynamic> toJson() => _$TransferInEntiyToJson(this);
}

