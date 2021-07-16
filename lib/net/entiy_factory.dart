import 'package:ipfsnets/models/access_token_entity.dart';
import 'package:ipfsnets/models/image_entity.dart';
import 'package:ipfsnets/models/user_entity.dart';

class EntityFactory {
  static T? generateOBJ<T>(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    String name = T.toString();
    if (name == "AccessTokenEntity") {
      return AccessTokenEntity.fromJson(json)as T;
    }else if (name == "UserEntity"){
      return UserEntity.fromJson(json)as T;
    } else if (name == "ImageEntity"){
      return ImageEntity.fromJson(json)as T;
    } else {
      return json as T;
    }
  }
}

