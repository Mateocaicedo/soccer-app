// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
// ignore_for_file: public_member_api_docs, avoid_dynamic_calls, implementation_imports

// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:convert';

import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:repository/src/models/fixtures.dart';
import 'package:repository/src/models/league.dart';
import 'package:repository/src/models/player.dart';
import 'package:repository/src/models/team.dart';

/// {@template service}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class Service {
  /// {@macro service}
  const Service();

  final String _baseUrl = 'https://apiv2.allsportsapi.com/football/';
  final String _apiKey = '&APIkey=9376347fe806883c7044f0209570d2b0601453cf5d3599dabb7ab850e719b046';

    
  Future<List<League>> getLeagues() async {
    // Create the URL
    final response = await http.get(Uri.parse('$_baseUrl?met=Leagues$_apiKey'));
    
    //if the response is not ok, we throw an error
    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    } 
    // Decode the JSON
    // We use jsonDecode to decode the JSON
    // https://api.dart.dev/stable/2.10.4/dart-convert/jsonDecode.html
    // Return the decoded JSON
    final withoutUtf = utf8.decode(response.bodyBytes);
  
    final body = jsonDecode(withoutUtf)['result'] as List;
    // Decode the JSON
    // ignore: omit_local_variable_types
    final List<League> leagues = body.map<League>((dynamic item) {
      return League.fromJson(item as Map<String, dynamic>);
    }).toList();
    // Map the results to a list of strings
    
    // ignore: avoid_dynamic_calls, lines_longer_than_80_chars
    return leagues;
  }


  Future<List<Team>> getTeams() async {

    final now = DateTime.now().toLocal();

    final to = now.add(const Duration(days: 7));

    final formatted = DateFormat('yyyy-MM-dd').format(now);
    final formattedTo = DateFormat('yyyy-MM-dd').format(to);  

   

    print('$formatted $formattedTo');
    // Create the URL
    final response = await http.get(Uri.parse('$_baseUrl?&met=Teams&leagueId=206$_apiKey'));
    
    //if the response is not ok, we throw an error
    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    } 
    // Decode the JSON
    // We use jsonDecode to decode the JSON
    // https://api.dart.dev/stable/2.10.4/dart-convert/jsonDecode.html
    // Return the decoded JSON
    final withoutUtf = utf8.decode(response.bodyBytes);
  
    final body = jsonDecode(withoutUtf)['result'] as List;
    // Decode the JSON
    // ignore: omit_local_variable_types
    final List<Team> teams = body.map<Team>((dynamic item) {
      return Team.fromJson(item as Map<String, dynamic>);
    }).toList();
    // Map the results to a list of strings
    
    return teams;
  }

  Future<List<Fixtures>> getFixtures(String leagueID) async {

    final now = DateTime.now();

    final to = now.add(const Duration(days: 7));

    final formatted = DateFormat('yyyy-MM-dd').format(now);
    final formattedTo = DateFormat('yyyy-MM-dd').format(to);  

    // Create the URL
    final response = await http.get(Uri.parse('$_baseUrl?met=Fixtures&leagueId=$leagueID&timezone=America/New_York&from=$formatted&to=$formattedTo$_apiKey'));
    
    //if the response is not ok, we throw an error
    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    } 
    // Decode the JSON
    // We use jsonDecode to decode the JSON
    // https://api.dart.dev/stable/2.10.4/dart-convert/jsonDecode.html
    // Return the decoded JSON
    final withoutUtf = utf8.decode(response.bodyBytes);
  
    
    final body = jsonDecode(withoutUtf)['result'] as List;
    // Decode the JSON
    // ignore: omit_local_variable_types
    final List<Fixtures> fixtures = body.map<Fixtures>((dynamic item) {
      return Fixtures.fromJson(item as Map<String, dynamic>);
    }).toList();
    // Map the results to a list of strings
    
    return fixtures;
  }



  Future<List<Player>> getPlayersByTeam(String teamName) async {
    // Create the URL
    final response = await http.get(Uri.parse('$_baseUrl?met=Teams&teamName=$teamName$_apiKey'));
    
    //if the response is not ok, we throw an error
    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    } 
    // Decode the JSON
    // We use jsonDecode to decode the JSON
    // https://api.dart.dev/stable/2.10.4/dart-convert/jsonDecode.html
    // Return the decoded JSON
    final withoutUtf = utf8.decode(response.bodyBytes);
  
    final body = jsonDecode(withoutUtf)['result']['players'] as List;	
    // Decode the JSON
    // ignore: omit_local_variable_types
    
    final players = body.map<Player>((dynamic item) {
      return Player.fromJson(item as Map<String, dynamic>);
    }).toList();
    // Map the results to a list of strings
    
    return players;
  }


 


  Future fetch() async {
    
  }
}
