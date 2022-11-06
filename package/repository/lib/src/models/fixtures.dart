


class Fixtures {
    Fixtures({
        required this.eventKey,
        required this.eventDate,
        required this.eventTime,
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
        required this.leagueRound,
        required this.leagueSeason,
        required this.eventStadium,
        required this.eventReferee,
        required this.homeTeamLogo,
        required this.awayTeamLogo,
        required this.eventCountryKey,
        required this.leagueLogo,
        required this.countryLogo,
    });

    String eventKey;
    DateTime eventDate;
    String eventTime;
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
    String leagueRound;
    String leagueSeason;
    String eventStadium;
    String eventReferee;
    String homeTeamLogo;
    String awayTeamLogo;
    String eventCountryKey;
    String leagueLogo;
    String countryLogo;

    factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        eventKey: json["event_key"].toString(),
        eventDate: DateTime.parse(json["event_date"].toString()),
        eventTime: json["event_time"].toString(),
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
        leagueRound: json["league_round"].toString(),
        leagueSeason: json["league_season"].toString(),
        eventStadium: json["event_stadium"].toString(),
        eventReferee: json["event_referee"].toString(),
        homeTeamLogo: json["home_team_logo"].toString(),
        awayTeamLogo: json["away_team_logo"].toString(),
        eventCountryKey: json["event_country_key"].toString(),
        leagueLogo: json["league_logo"].toString(),
        countryLogo: json["country_logo"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "event_key": eventKey,
        "event_date": "${eventDate.year.toString().padLeft(4, '0')}-${eventDate.month.toString().padLeft(2, '0')}-${eventDate.day.toString().padLeft(2, '0')}",
        "event_time": eventTime,
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
        "league_round": leagueRound,
        "league_season": leagueSeason,
        "event_stadium": eventStadium,
        "event_referee": eventReferee,
        "home_team_logo": homeTeamLogo,
        "away_team_logo": awayTeamLogo,
        "event_country_key": eventCountryKey,
        "league_logo": leagueLogo,
        "country_logo": countryLogo,
    };
}
