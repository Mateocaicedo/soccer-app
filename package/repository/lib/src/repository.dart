// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
// ignore_for_file: public_member_api_docs

import 'package:repository/src/models/fixtures.dart';
import 'package:repository/src/models/league.dart';
import 'package:repository/src/models/team.dart';
import 'package:repository/src/models/topscorers.dart';
import 'package:service/service.dart';


// create a repository class
class Repository {
  
  Repository();


  //instance of the service class
  final Service _service = const Service();


  //create a method to get all leagues
  Future<List<League>> leagues() async {

    final leagues = await _service.getLeagues();

    return leagues;

  }

  //create a method to get a list of fixtures
   Future<List<Fixtures>> fixtures(int leagueID) async {

    final fixtures = await _service.getFixtures(leagueID);

    return fixtures;

  }


  //create a method to get a list of teams
  Future<List<Team>> teams(int leagueID) async {

    final teams = await _service.getTeams(leagueID);

    return teams;

  }


  //create a method to get a list of top scorers
  Future<List<TopScorers>> topscorers(int leagueID) async {

    final topscorers = await _service.getTopScorers(leagueID);

    return topscorers;

  }


}
