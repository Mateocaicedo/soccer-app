// ignore_for_file: public_member_api_docs


//create a class for the league
class League {
    
    //create a constructor for the league class
    League({
        required this.leagueKey,
        required this.leagueName,
        required this.countryKey,
        required this.countryName,
        required this.leagueLogo,
        required this.countryLogo,
    });

    //create a instance of the league class from json
    factory League.fromJson(Map<String, dynamic> json) => League(
        leagueKey: json['league_key'].toString(),
        leagueName: json['league_name'].toString(),
        countryKey: json['country_key'].toString(),
        countryName: json['country_name'].toString(),
        leagueLogo: json['league_logo'].toString(),
        countryLogo: json['country_logo'].toString(),
    );

    String leagueKey;
    String leagueName;
    String countryKey;
    String countryName;
    String leagueLogo;
    String countryLogo;

   
}
