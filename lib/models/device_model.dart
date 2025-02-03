import 'package:json_annotation/json_annotation.dart';

part 'device_model.g.dart';

@JsonSerializable()
class DeviceModel {
  final String deviceType;
  final String deviceId;
  final String deviceName;
  final String deviceOSVersion;
  final String deviceIPAddress;
  final double lat;
  final double long;
  final String buyerGcmid;
  final String buyerPemid;
  final AppInfo app;

  DeviceModel({
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOSVersion,
    required this.deviceIPAddress,
    required this.lat,
    required this.long,
    required this.buyerGcmid,
    required this.buyerPemid,
    required this.app,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceType: json['deviceType'] ?? 'android',
      deviceId: json['deviceId'] ?? '',
      deviceName: json['deviceName'] ?? '',
      deviceOSVersion: json['deviceOSVersion'] ?? '',
      deviceIPAddress: json['deviceIPAddress'] ?? '',
      lat: json['lat'] ?? 0.0,
      long: json['long'] ?? 0.0,
      buyerGcmid: json['buyer_gcmid'] ?? '',
      buyerPemid: json['buyer_pemid'] ?? '',
      app: AppInfo.fromJson(json['app'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);
}

@JsonSerializable()
class AppInfo {
  final String version;
  final String installTimeStamp;
  final String uninstallTimeStamp;
  final String downloadTimeStamp;

  AppInfo({
    required this.version,
    required this.installTimeStamp,
    required this.uninstallTimeStamp,
    required this.downloadTimeStamp,
  });

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      version: json['version'] ?? '',
      installTimeStamp: json['installTimeStamp'] ?? '',
      uninstallTimeStamp: json['uninstallTimeStamp'] ?? '',
      downloadTimeStamp: json['downloadTimeStamp'] ?? '',
    );
  }

  // Convert the model to JSON
  Map<String, dynamic> toJson() => _$AppInfoToJson(this);
}
