import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "token_model.g.dart";

@JsonSerializable()
class TokenModel extends Equatable {
  final String? access;
  final String? refresh;

  const TokenModel({
    this.access,
    this.refresh,
  });
  TokenModel fromJson(Map<String, dynamic> json) {
    return _$TokenModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  @override
  List<Object?> get props => [access, refresh];

  TokenModel copyWith({
    String? access,
    String? refresh,
  }) {
    return TokenModel(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
    );
  }
}
