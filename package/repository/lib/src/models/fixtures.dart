


class Fixtures {
    Fixtures({
        required this.eventKey,
        required this.eventDate,
        required this.eventHomeTeam,
        required this.homeTeamKey,
        required this.eventAwayTeam,
        required this.awayTeamKey,
        required this.eventHalftimeResult,
        required this.eventFinalResult,
        required this.eventFtResult,
        required this.eventStatus,
        required this.countryName,
        required this.leagueName,
        required this.leagueKey,
        required this.eventStadium,
        required this.homeTeamLogo,
        required this.awayTeamLogo,
        required this.leagueLogo,
    });

    String eventKey;
    DateTime eventDate;
    String eventHomeTeam;
    String homeTeamKey;
    String eventAwayTeam;
    String awayTeamKey;
    String eventHalftimeResult;
    String eventFinalResult;
    String eventFtResult;
    String eventStatus;
    String countryName;
    String leagueName;
    String leagueKey;
    String eventStadium;
    String homeTeamLogo;
    String awayTeamLogo;
    String leagueLogo;
    factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        eventKey: json["event_key"].toString(),
        eventDate: DateTime.parse(json["event_date"].toString()),
        eventHomeTeam: json["event_home_team"].toString(),
        homeTeamKey: json["home_team_key"].toString(),
        eventAwayTeam: json["event_away_team"].toString(),
        awayTeamKey: json["away_team_key"].toString(),
        eventHalftimeResult: json["event_halftime_result"].toString(),
        eventFinalResult: json["event_final_result"].toString(),
        eventFtResult: json["event_ft_result"].toString(),
        eventStatus: json["event_status"].toString(),
        countryName: json["country_name"].toString(),
        leagueName: json["league_name"].toString(),
        leagueKey: json["league_key"].toString(),
        eventStadium: json["event_stadium"].toString(),
        homeTeamLogo: json["home_team_logo"].toString(),
        awayTeamLogo: json["away_team_logo"].toString(),
        leagueLogo: json["league_logo"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "event_key": eventKey,
        "event_date": "${eventDate.year.toString().padLeft(4, '0')}-${eventDate.month.toString().padLeft(2, '0')}-${eventDate.day.toString().padLeft(2, '0')}",
        "event_home_team": eventHomeTeam,
        "home_team_key": homeTeamKey,
        "event_away_team": eventAwayTeam,
        "away_team_key": awayTeamKey,
        "event_halftime_result": eventHalftimeResult,
        "event_final_result": eventFinalResult,
        "event_ft_result": eventFtResult,
        "event_status": eventStatus,
        "country_name": countryName,
        "league_name": leagueName,
        "league_key": leagueKey,
        "event_stadium": eventStadium,
        "home_team_logo": homeTeamLogo,
        "away_team_logo": awayTeamLogo,
        "league_logo": leagueLogo,
    };
}
