import 'package:bloc/bloc.dart';

import 'package:repository/repository.dart';
import 'package:repository/src/models/league.dart';
import 'package:repository/src/models/team.dart';
part 'league_state.dart';


//create a cubit for the leagues
class LeagueCubit extends Cubit<LeagueState> {
  LeagueCubit(this.league) : super(LeagueState());

  final Repository league;

  //get the leagues
  Future<void> getLeagues() async {

    //emit the state
    emit(state.copyWith(status: LeaguesStatus.loading));
    try {
      final leagues = await league.leagues();
      emit(state.copyWith(status: LeaguesStatus.success, leagues: leagues));
    } catch (e) {
      emit(state.copyWith(status: LeaguesStatus.failure));
    }
  }

  
}
