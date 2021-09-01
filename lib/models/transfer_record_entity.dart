import 'package:json_annotation/json_annotation.dart';



part 'transfer_record_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class TransferRecordEntity{
	TransferRecordEntity();
	late num coinCode;
	late String coinIcon;
	late String coinName;
	late num createTime;
	late String fromNickname;
	late String fromUsername;
	late String toNickname;
	late String toUsername;
	// 状态 0 成功  其他失败
	late num status;
	late num transferNumber;
	// 0 收款， 1 转出
	late num outStatus;

	factory TransferRecordEntity.fromJson(Map<String, dynamic> json) => _$TransferRecordEntityFromJson(json);
	Map<String, dynamic> toJson() => _$TransferRecordEntityToJson(this);

}
