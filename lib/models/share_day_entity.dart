import 'package:json_annotation/json_annotation.dart';
import 'package:ipfsnets/models/share_cion_entity.dart';
part 'share_day_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class ShareDayEntity {
	late num freezeNum;
	late num releaseNow;
	late List<ShareCionEntity?> servEarnings;
	late num todayEarning;
	late num totalNum;
	ShareDayEntity();

	init(){
		freezeNum = 0;
		releaseNow = 0;
		servEarnings = [];
		todayEarning = 0;
		totalNum = 0;
	}
factory ShareDayEntity.fromJson(Map<String, dynamic> json) => _$ShareDayEntityFromJson(json);

Map<String, dynamic> toJson() => _$ShareDayEntityToJson(this);
}
