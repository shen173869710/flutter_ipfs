import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'image_entity.g.dart';
@JsonSerializable()
class ImageEntity {
  late String name;
  late String url;
	ImageEntity();
  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageEntityToJson(this);


}
