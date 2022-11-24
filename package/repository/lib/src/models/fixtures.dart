// ignore_for_file: public_member_api_docs

import 'package:repository/src/models/league.dart';
import 'package:repository/src/models/team.dart';


class Fixtures {

    //create a constructor for the fixtures class
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
        required this.eventTime,
    });
    

    //create a instance of the fixtures class from json
    factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        eventKey: json['event_key'].toString(),
        eventDate: DateTime.parse(json['event_date'].toString()),
        eventTime: json['event_time'].toString(),
        eventHomeTeam: json['event_home_team'].toString(),
        homeTeamKey: json['home_team_key'].toString(),
        eventAwayTeam: json['event_away_team'].toString(),
        awayTeamKey: json['away_team_key'].toString(),
        eventHalftimeResult: json['event_halftime_result'].toString(),
        eventFinalResult: json['event_final_result'].toString(),
        eventFtResult: json['event_ft_result'].toString(),
        eventStatus: json['event_status'].toString(),
        countryName: json['country_name'].toString(),
        leagueName: json['league_name'].toString(),
        leagueKey: json['league_key'].toString(),
        eventStadium: json['event_stadium'].toString(),
        homeTeamLogo: json['home_team_logo'].toString(),
        awayTeamLogo: json['away_team_logo'].toString(),
        leagueLogo: json['league_logo'].toString(),

    );

    late League league;
    late Team homeTeam;
    late Team awayTeam;
    
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
    String eventTime;

    
}
