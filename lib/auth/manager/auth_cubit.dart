import 'package:cs_tech_task/auth/manager/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  void setUserId(String userId) {
    emit(state.copyWith(userId: userId));
  }

  void setDeviceId(String deviceId) {
    emit(state.copyWith(deviceId: deviceId));
  }
}
