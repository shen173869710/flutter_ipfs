import 'package:json_annotation/json_annotation.dart';


part 'find__entity.g.dart';
@JsonSerializable()
class FindEntity {
	late String createBy;
	late String createTime;
	late String noticeContent;
	late int noticeId;
	late String noticeTitle;
	late String noticeType;
	late String remark;
	late String searchValue;
	late String status;
	late String updateBy;
	late String updateTime;

	FindEntity();

factory FindEntity.fromJson(Map<String, dynamic> json) => _$FindEntityFromJson(json);

Map<String, dynamic> toJson() => _$FindEntityToJson(this);
}

