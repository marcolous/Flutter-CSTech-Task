import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  String? email;
  String? password;
  String? referralCode;
  String? userId;

  RegisterModel({
    this.email,
    this.password,
    this.referralCode,
    this.userId,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      referralCode: json['referralCode'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
