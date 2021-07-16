import 'package:json_annotation/json_annotation.dart';

part 'data_entiy.g.dart';
@JsonSerializable()
class DataEntiy {
  late String name;
  late String email;

  DataEntiy(this.name, this.email);

  factory DataEntiy.fromJson(Map<String, dynamic> json) => _$DataEntiyFromJson(json);

Map<String, dynamic> toJson() => _$DataEntiyToJson(this);

}