// To parserequired this JSON data, do
//
//     final player = playerFromJson(jsonString);

import 'dart:convert';

// Player playerFromJson(String str) => Player.fromJson(json.decode(str));

// String playerToJson(Player data) => json.encode(data.toJson());

class Player {
    Player({
       required this.playerKey,
       required this.playerName,
       required this.playerNumber,
       required this.playerCountry,
       required this.playerType,
       required this.playerAge,
       required this.playerMatchPlayed,
       required this.playerGoals,
       required this.playerAssists,
       required this.playerRating,
       required this.teamName,
       required this.teamKey,
       required this.playerImage,
    });

    String playerKey;
    String playerName;
    String playerNumber;
    dynamic playerCountry;
    String playerType;
    String playerAge;
    String playerMatchPlayed;
    String playerGoals;
    String playerAssists;
    String playerRating;
    String teamName;
    String teamKey;
    String playerImage;

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        playerKey: json["player_key"].toString(),
        playerName: json["player_name"].toString(),
        playerNumber: json["player_number"].toString(),
        playerCountry: json["player_country"].toString(),
        playerType: json["player_type"].toString(),
        playerAge: json["player_age"].toString(),
        playerMatchPlayed: json["player_match_played"].toString(),
        playerGoals: json["player_goals"].toString(),
        playerAssists: json["player_assists"].toString(),
        playerRating: json["player_rating"].toString(),
        teamName: json["team_name"].toString(),
        teamKey: json["team_key"].toString(),
        playerImage: json["player_image"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "player_key": playerKey,
        "player_name": playerName,
        "player_number": playerNumber,
        "player_country": playerCountry,
        "player_type": playerType,
        "player_age": playerAge,
        "player_match_played": playerMatchPlayed,
        "player_goals": playerGoals,
        "player_assists": playerAssists,
        "player_rating": playerRating,
        "team_name": teamName,
        "team_key": teamKey,
        "player_image": playerImage,
    };
}