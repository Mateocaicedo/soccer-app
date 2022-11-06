import 'dart:convert';

// League leagueFromJson(String str) => League.fromJson(json.decode(str));

// String leagueToJson(League data) => json.encode(data.toJson());

class League {
    // ignore: public_member_api_docs
    League({
        required this.leagueKey,
        required this.leagueName,
        required this.countryKey,
        required this.countryName,
        required this.leagueLogo,
        required this.countryLogo,
    });

    String leagueKey;
    String leagueName;
    String countryKey;
    String countryName;
    String leagueLogo;
    String countryLogo;

    factory League.fromJson(Map<String, dynamic> json) => League(
        leagueKey: json['league_key'].toString(),
        leagueName: json['league_name'].toString(),
        countryKey: json['country_key'].toString(),
        countryName: json['country_name'].toString(),
        leagueLogo: json['league_logo'].toString(),
        countryLogo: json['country_logo'].toString(),
    );

     // ignore: public_member_api_docs
     Map<String, dynamic> toJson() => {
        'league_key': leagueKey,
        'league_name': leagueName,
        'country_key': countryKey,
        'country_name': countryName,
        'league_logo': leagueLogo,
        'country_logo': countryLogo,
    };
   
}
