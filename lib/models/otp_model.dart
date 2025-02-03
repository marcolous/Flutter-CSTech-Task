
import 'package:json_annotation/json_annotation.dart';

part 'otp_model.g.dart';

@JsonSerializable()
class OtpModel {
  String? otp;
  String? mobileNumber;
  String? deviceId;

  OtpModel({
    this.otp,
    this.mobileNumber,
    this.deviceId,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      otp: json['otp'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      deviceId: json['deviceId'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => _$OtpModelToJson(this);
}
