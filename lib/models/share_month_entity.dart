import 'package:json_annotation/json_annotation.dart';
import 'package:ipfsnets/models/share_cion_entity.dart';




part 'share_month_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class ShareMonthEntity {
	late List<ShareCionEntity?>earningList;
	late num total;
	ShareMonthEntity();
factory ShareMonthEntity.fromJson(Map<String, dynamic> json) => _$ShareMonthEntityFromJson(json);
Map<String, dynamic> toJson() => _$ShareMonthEntityToJson(this);

}
