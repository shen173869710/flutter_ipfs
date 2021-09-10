import 'package:json_annotation/json_annotation.dart';


part 'machine_top_entity.g.dart';
@JsonSerializable()
class MachineTopEntity {
	late double allRealCap;
	late double allUseCap;
	late double allYield;
	late double machineNumber;
	late double onlineNumber;
	late double todayYield;
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
