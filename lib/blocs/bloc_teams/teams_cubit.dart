import 'package:bloc/bloc.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/models/team.dart';
part 'teams_state.dart';

//create a cubit for teams
class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit(this.teams) : super(TeamsState());

  final Repository teams;
  
  //get teams by league id
  Future<void> getTeams(leagueID) async {

    //emit state
    emit(state.copyWith(status: TeamsStatus.loading));
    try {
      final teams = await this.teams.teams(leagueID);
      emit(state.copyWith(status: TeamsStatus.success, teams: teams));
    } catch (e) {
      emit(state.copyWith(status: TeamsStatus.failure));
    }
  }
}