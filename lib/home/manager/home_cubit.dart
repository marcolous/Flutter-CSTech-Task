import 'package:cs_tech_task/home/manager/home_state.dart';
import 'package:cs_tech_task/models/home_model.dart';
import 'package:cs_tech_task/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(homeModel: null));
  ApiService service = ApiService();
  HomeModel? get homeModel => state.homeModel;

  void setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  Future<void> fetchHomeData() async {
    try {
      setLoading(true);
      final data = await service.getHomeWithoutPrice();
      emit(state.copyWith(homeModel: data));
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }
}
