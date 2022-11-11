import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/models/league.dart';
part 'league_state.dart';

class LeagueCubit extends Cubit<LeagueState> {
  LeagueCubit(this.league) : super(LeagueState());

  final Repository league;


  Future<void> getLeagues() async {
    emit(state.copyWith(status: LeaguesStatus.loading));
    try {
      final leagues = await league.leagues();
      emit(state.copyWith(status: LeaguesStatus.success, leagues: leagues));
    } catch (e) {
      emit(state.copyWith(status: LeaguesStatus.failure));
    }
  }
}
