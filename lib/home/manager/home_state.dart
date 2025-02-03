import 'package:cs_tech_task/models/home_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(null) HomeModel? homeModel,
  }) = _HomeState;
}
