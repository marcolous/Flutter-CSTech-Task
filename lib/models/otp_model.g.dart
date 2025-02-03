// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpModel _$OtpModelFromJson(Map<String, dynamic> json) => OtpModel(
      otp: json['otp'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$OtpModelToJson(OtpModel instance) => <String, dynamic>{
      'otp': instance.otp,
      'mobileNumber': instance.mobileNumber,
      'deviceId': instance.deviceId,
    };
