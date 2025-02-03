import 'package:cs_tech_task/models/device_model.dart';
import 'package:cs_tech_task/models/home_model.dart';
import 'package:cs_tech_task/models/login_model.dart';
import 'package:cs_tech_task/models/otp_model.dart';
import 'package:cs_tech_task/models/register_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://devapiv4.dealsdray.com/api/v2',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  Future<bool> addDevice(DeviceModel data) async {
    final payload = data.toJson();
    try {
      final response = await _dio.post('/user/device/add', data: payload);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response?> sendOtp(LoginModel data) async {
    final paylod = data.toJson();
    try {
      final response = await _dio.post('/user/otp', data: paylod);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return response;
      } else {
        return null;
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response?> verifyOtp(OtpModel data) async {
    final paylod = data.toJson();
    try {
      final response = await _dio.post('/user/otp/verification', data: paylod);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return response;
      } else {
        return null;
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> emailReferral(RegisterModel data) async {
    final paylod = data.toJson();
    try {
      final response = await _dio.post('/user/email/referral', data: paylod);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<HomeModel> getHomeWithoutPrice() async {
    try {
      final response = await _dio.get('/user/home/withoutPrice');

      final responseData = response.data as Map<String, dynamic>;

      final data = HomeModel.fromJson(responseData);
      return data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw 'Request timed out';
      case DioExceptionType.badResponse:
        throw 'Received invalid status code: ${error.response?.statusCode}';
      case DioExceptionType.cancel:
        throw 'Request was cancelled';
      default:
        throw 'An unexpected error occurred';
    }
  }
}
