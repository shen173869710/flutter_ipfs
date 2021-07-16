// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenEntity _$AccessTokenEntityFromJson(Map<String, dynamic> json) {
  return AccessTokenEntity(
    json['access_token'] as String,
    json['expires_in'] as int,
  );
}

Map<String, dynamic> _$AccessTokenEntityToJson(AccessTokenEntity instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
    };
