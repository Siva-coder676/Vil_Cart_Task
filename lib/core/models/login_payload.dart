import 'package:json_annotation/json_annotation.dart';
part 'login_payload.g.dart';

@JsonSerializable()
class LoginPayload {
  final String? mobileNo;
  final String? password;
  final String? userGroup;
  final String? client;
  LoginPayload({this.mobileNo, this.password, this.userGroup, this.client});

  factory LoginPayload.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPayloadToJson(this);
}
