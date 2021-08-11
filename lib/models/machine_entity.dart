import 'package:json_annotation/json_annotation.dart';


part 'machine_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class MachineEntity  {
	late num alreadyGas;
	late num alreadyPledge;
	late num buyCap;
	late String chain;
	late num createTime;
	late num gas;
	late num hostingExpTime;
	late num machineId;
	late num hostingStatus;
	late num income;
	late String name;
	late String nodeName;
	late String online;
	late num onlineTime;
	late num pledge;
	late num realCap;
	late String symbol;
	late num useCap;
	MachineEntity();
factory MachineEntity.fromJson(Map<String, dynamic> json) => _$MachineEntityFromJson(json);

Map<String, dynamic> toJson() => _$MachineEntityToJson(this);
}
