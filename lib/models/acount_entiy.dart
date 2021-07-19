import 'package:json_annotation/json_annotation.dart';

part 'acount_entiy.g.dart';
@JsonSerializable()
class AccountEntiy{
  late String accountName;
  late String accountBank;
  late String accountNumber;
  late String type;
  AccountEntiy();
  

factory AccountEntiy.fromJson(Map<String, dynamic> json) => _$AccountEntiyFromJson(json);

Map<String, dynamic> toJson() => _$AccountEntiyToJson(this);
}