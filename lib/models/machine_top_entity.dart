import 'package:json_annotation/json_annotation.dart';


part 'machine_top_entity.g.dart';
@JsonSerializable()
class MachineTopEntity {
	late num allRealCap;
	late num allUseCap;
	late num allYield;
	late num machineNumber;
	late num onlineNumber;
	late num todayYield;
	MachineTopEntity();
factory MachineTopEntity.fromJson(Map<String, dynamic> json) => _$MachineTopEntityFromJson(json);

Map<String, dynamic> toJson() => _$MachineTopEntityToJson(this);


	init() {
		allRealCap = 0;
		allUseCap = 0;
		allYield = 0;
		machineNumber = 0;
		onlineNumber = 0;
		todayYield = 0;
	}
}
