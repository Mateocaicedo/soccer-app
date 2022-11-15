part of 'teams_cubit.dart';

enum TeamsStatus { loading, success, failure }

class TeamsState {
  TeamsState({
    this.status = TeamsStatus.loading,
    this.teams = const <Team>[],
  });

  final TeamsStatus status;
  // Team premierLeague = Team(teamKey: "152", teamName: "Premier League", countryKey: "44", countryName: "England", countryLogo: "https://apiv2.allsportsapi.com/logo/logo_country/44_england.png", teamLogo: "https://apiv2.allsportsapi.com/logo/logo_leagues/152_premier-league.png");

  List<Team> teams;

  TeamsState copyWith({
    TeamsStatus? status,
    List<Team>? teams,
  }) {
    return TeamsState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
    );
  }
}