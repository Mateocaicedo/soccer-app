// ignore_for_file: public_member_api_docs


import 'package:repository/src/models/player.dart';



// String teamToJson(Team data) => json.encode(data.toJson());


//create a class for the team
class Team { 

    //create a constructor for the team class
    Team({
        required this.teamKey,
        required this.teamName,
        required this.teamLogo,
        required this.players,
    });

    //create a instance of the team class from json
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

    
    String teamKey = '';
    String teamName = '';
    String teamLogo = '';
    List<Player> players = [];

    
    
}
