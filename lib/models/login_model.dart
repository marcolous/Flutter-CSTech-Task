import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? mobileNumber;
  String? deviceId;

  LoginModel({
    this.mobileNumber,
    this.deviceId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      mobileNumber: json['mobileNumber'] ?? '',
      deviceId: json['deviceId'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
