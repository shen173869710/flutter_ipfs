import 'package:json_annotation/json_annotation.dart';

part 'app_info_entity.g.dart';
@JsonSerializable()
class AppInfoEntiy {
  late bool hasUpdate;
  late bool isIgnorable;
  late num versionCode;
  late String versionName;
  late String modifyContent;
  late String downloadUrl;
  late num updateStatus;
  late int apkSize;

  AppInfoEntiy();
factory AppInfoEntiy.fromJson(Map<String, dynamic> json) => _$AppInfoEntiyFromJson(json);

Map<String, dynamic> toJson() => _$AppInfoEntiyToJson(this);

}