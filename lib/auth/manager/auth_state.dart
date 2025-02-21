import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default('') String userId,
    @Default('') String deviceId,
    @Default('') String number,
  }) = _AuthState;
}
