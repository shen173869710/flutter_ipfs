import 'package:json_annotation/json_annotation.dart';


part 'machine_hosting_entity.g.dart';
@JsonSerializable()
class MachineHostingEntity{
	late num cnyBalance;
	late num cnyPrice;
	late num hostingDay;
	late List<int> hostingPeriod;
	late num machineId;
	late num hostingStatus;
	late String nodeName;
	late String symbol;
	late num usdtBalance;
	late num usdtPrice;
	late num expand;

	MachineHostingEntity();

factory MachineHostingEntity.fromJson(Map<String, dynamic> json) => _$MachineHostingEntityFromJson(json);

Map<String, dynamic> toJson() => _$MachineHostingEntityToJson(this);
}
