// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
      deviceType: json['deviceType'] as String,
      deviceId: json['deviceId'] as String,
      deviceName: json['deviceName'] as String,
      deviceOSVersion: json['deviceOSVersion'] as String,
      deviceIPAddress: json['deviceIPAddress'] as String,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      buyerGcmid: json['buyerGcmid'] as String,
      buyerPemid: json['buyerPemid'] as String,
      app: AppInfo.fromJson(json['app'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'deviceType': instance.deviceType,
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'deviceOSVersion': instance.deviceOSVersion,
      'deviceIPAddress': instance.deviceIPAddress,
      'lat': instance.lat,
      'long': instance.long,
      'buyerGcmid': instance.buyerGcmid,
      'buyerPemid': instance.buyerPemid,
      'app': instance.app,
    };

AppInfo _$AppInfoFromJson(Map<String, dynamic> json) => AppInfo(
      version: json['version'] as String,
      installTimeStamp: json['installTimeStamp'] as String,
      uninstallTimeStamp: json['uninstallTimeStamp'] as String,
      downloadTimeStamp: json['downloadTimeStamp'] as String,
    );

Map<String, dynamic> _$AppInfoToJson(AppInfo instance) => <String, dynamic>{
      'version': instance.version,
      'installTimeStamp': instance.installTimeStamp,
      'uninstallTimeStamp': instance.uninstallTimeStamp,
      'downloadTimeStamp': instance.downloadTimeStamp,
    };
