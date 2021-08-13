import 'package:json_annotation/json_annotation.dart';


part 'machine_pledge_entity.g.dart';
@JsonSerializable()
class MachinePledgeEntity{
	late num alreadyAmount;
	late num amount;
	late num gas;
	late num machineId;
	late num needAmount;
	late num pledge;
	late num realCap;
	late String symbol;


	init() {
		alreadyAmount = 0;
		amount = 0;
		gas = 0;
		machineId = 0;
		needAmount = 0;
		pledge = 0;
		realCap = 0;
		symbol = "";
	}

	MachinePledgeEntity();

factory MachinePledgeEntity.fromJson(Map<String, dynamic> json) => _$MachinePledgeEntityFromJson(json);

Map<String, dynamic> toJson() => _$MachinePledgeEntityToJson(this);
}
