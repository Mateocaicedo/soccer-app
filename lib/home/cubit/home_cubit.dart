import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/models/league.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.league) : super(HomeState());

  final Repository league;


  Future<void> getLeagues() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final leagues = await league.Leagues();
      emit(state.copyWith(status: HomeStatus.success, leagues: leagues));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
