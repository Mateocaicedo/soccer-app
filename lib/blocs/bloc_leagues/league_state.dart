part of 'league_cubit.dart';

enum LeaguesStatus {loading, success, failure }

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
