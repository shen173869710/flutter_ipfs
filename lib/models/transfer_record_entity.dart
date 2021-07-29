import 'package:json_annotation/json_annotation.dart';



part 'transfer_record_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class TransferRecordEntity{
	TransferRecordEntity();
	late num coinCode;
	late String coinIcon;
	late String coinName;
	late num createTime;
	late String nickname;
	late num status;
	late num transferNumber;
	late String username;
	late num outStatus;

factory TransferRecordEntity.fromJson(Map<String, dynamic> json) => _$TransferRecordEntityFromJson(json);

Map<String, dynamic> toJson() => _$TransferRecordEntityToJson(this);



}
