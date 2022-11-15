import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/models/team.dart';
part 'teams_state.dart';


class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit(this.teams, this.leagueID) : super(TeamsState());

  final Repository teams;
  final String leagueID ;

  Future<void> getTeams() async {
    emit(state.copyWith(status: TeamsStatus.loading));
    try {
      final teams = await this.teams.teams(leagueID);
      emit(state.copyWith(status: TeamsStatus.success, teams: teams));
    } catch (e) {
      emit(state.copyWith(status: TeamsStatus.failure));
    }
  }
}