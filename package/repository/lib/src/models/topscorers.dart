
// ignore_for_file: public_member_api_docs

import 'package:repository/src/models/player.dart';
import 'package:repository/src/models/team.dart';

//create a top scorers class
class TopScorers {

  //create a constructor for the top scorers class
  
  TopScorers({
    required this.playerPlace,
    required this.playerKey,
    required this.playerName,
    required this.teamName,
    required this.teamKey,
    required this.goals,
    required this.assists,
    required this.penaltyGoals,
  });


  ///create a instance of the TopScorers class from json
  factory TopScorers.fromJson(Map<String, dynamic> json) => TopScorers(
        playerPlace: json['player_place'].toString(),
        playerKey: json['player_key'].toString(),
        playerName: json['player_name'].toString(),
        teamName: json['team_name'].toString(),
        teamKey: json['team_key'].toString(),
        goals: json['goals'].toString(),
        assists: json['assists'].toString(),
        penaltyGoals: json['penalty_goals'].toString(),
      );
  String playerPlace;
  String playerKey;
  String playerName;
  String teamName;
  String teamKey;
  String goals;
  String assists;
  String penaltyGoals;

  late Player player;
  late Team team;
  
}
