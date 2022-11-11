part of 'league_cubit.dart';

enum LeaguesStatus {loading, success, failure }

class LeagueState{
  LeagueState({
    this.status = LeaguesStatus.loading,
    this.leagues = const <League>[],
  });

  final LeaguesStatus status;
  final List<League> leagues;

  LeagueState copyWith({
    LeaguesStatus? status,
    List<League>? leagues,
  }) {
    return LeagueState(
      status: status ?? this.status,
      leagues: leagues ?? this.leagues,
    );
  }

}
