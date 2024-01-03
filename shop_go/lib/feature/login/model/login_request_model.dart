import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "login_request_model.g.dart";

@JsonSerializable()
class LoginRequestModel extends Equatable {
  final String? username;
  final String? password;

  const LoginRequestModel({
    this.username,
    this.password,
  });
  LoginRequestModel fromJson(Map<String, dynamic> json) {
    return _$LoginRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  @override
  List<Object?> get props => [username, password];

  LoginRequestModel copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequestModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
