import 'package:json_annotation/json_annotation.dart';


part 'share_cion_entity.g.dart';
@JsonSerializable()
class ShareCionEntity {
	late String createTime;
	late num extraCut;
	late num freezeNum;
	late num releaseDay;
	late num releaseNow;
	late num sid;
	late num total;
	ShareCionEntity();


	init() {
		createTime = "";
		extraCut = 0;
		freezeNum = 0;
		releaseDay = 0;
		releaseNow = 0;
		sid = 0;
		total = 0;
	}
factory ShareCionEntity.fromJson(Map<String, dynamic> json) => _$ShareCionEntityFromJson(json);

Map<String, dynamic> toJson() => _$ShareCionEntityToJson(this);
}
