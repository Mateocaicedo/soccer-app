// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:repository/src/models/player.dart';



// String teamToJson(Team data) => json.encode(data.toJson());

class Team {

    Team.fromJson(Map<String, dynamic> json) {
      teamKey = json['team_key'].toString();
      teamName = json['team_name'].toString();
      teamLogo = json['team_logo'].toString();
      if (json['players'] != null) {
        players = <Player>[];
        // ignore: avoid_dynamic_calls, inference_failure_on_untyped_parameter
        json['players'].forEach((v) {
          players.add(Player.fromJson(v as Map<String, dynamic>));
        });
      }
    } 


    Team({
        required this.teamKey,
        required this.teamName,
        required this.teamLogo,
        required this.players,
    });

    
    String teamKey = '';
    String teamName = '';
    String teamLogo = '';
    List<Player> players = [];

    

    Map<String, dynamic> toJson() => {
        "team_key": teamKey,
        "team_name": teamName,
        "team_logo": teamLogo,
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
    };
}
