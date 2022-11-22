part of 'league_cubit.dart';


//create a enum for the status of the leagues
enum LeaguesStatus {loading, success, failure }


//create a class for the state of the leagues
class LeagueState{
  LeagueState({
    
    this.teams = const <Team>[],
    this.status = LeaguesStatus.loading,
    this.leagues = const <League>[],
    
  });

  final LeaguesStatus status;
  

  List<League> leagues;
  List<Team> teams = [];

  LeagueState copyWith({
    LeaguesStatus? status,
    List<League>? leagues,
    List<Team>? teams,
  }) {
    return LeagueState(
      status: status ?? this.status,
      leagues: leagues ?? this.leagues,
      teams: teams ?? this.teams,
    );
  }

}
