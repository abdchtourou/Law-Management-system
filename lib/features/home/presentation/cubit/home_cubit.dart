import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:lms/core/usecases/usecase.dart';
import '../../data/model/nav_model.dart';
import '../../domain/usecase/get_home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeUseCase getHomeUseCase;
  HomeCubit(this.getHomeUseCase) : super(HomeInitial());

  Future<void> getHomeData() async {
    emit(HomeLoading());
    final result = await getHomeUseCase(const NoParams());
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (homeModel) => emit(HomeSuccess(homeModel)),
    );
  }
}
