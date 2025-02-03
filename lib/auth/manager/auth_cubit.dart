import 'package:cs_tech_task/auth/manager/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  String get userId => state.userId;
  String get deviceId => state.deviceId;
  String get number => state.number;

  void setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  void setUserId(String userId) {
    emit(state.copyWith(userId: userId));
  }

  void setDeviceId(String deviceId) {
    emit(state.copyWith(deviceId: deviceId));
  }

  void setNumber(String number) {
    emit(state.copyWith(number: number));
  }
}
