// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPayload _$LoginPayloadFromJson(Map<String, dynamic> json) => LoginPayload(
      mobileNo: json['mobileNo'] as String?,
      password: json['password'] as String?,
      userGroup: json['userGroup'] as String?,
      client: json['client'] as String?,
    );

Map<String, dynamic> _$LoginPayloadToJson(LoginPayload instance) =>
    <String, dynamic>{
      'mobileNo': instance.mobileNo,
      'password': instance.password,
      'userGroup': instance.userGroup,
      'client': instance.client,
    };
