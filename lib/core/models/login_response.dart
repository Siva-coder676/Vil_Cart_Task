import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';


@JsonSerializable()
class LoginResponse {
  final bool? status;
  final String? message;
  final String? token;
  final String? refreshToken;
  LoginResponse({this.status, this.message, this.token, this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
