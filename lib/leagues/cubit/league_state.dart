part of 'league_cubit.dart';

enum LeaguesStatus {loading, success, failure }

class LeagueState{
  LeagueState({
    this.status = LeaguesStatus.loading,
    this.leagues = const <League>[],
  });

  final LeaguesStatus status;
  // League premierLeague = League(leagueKey: "152", leagueName: "Premier League", countryKey: "44", countryName: "England", countryLogo: "https://apiv2.allsportsapi.com/logo/logo_country/44_england.png", leagueLogo: "https://apiv2.allsportsapi.com/logo/logo_leagues/152_premier-league.png");
  

  List<League> leagues;

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