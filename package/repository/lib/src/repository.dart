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


/// {@template repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class Repository {
  /// {@macro repository}
  Repository();

  final Service _service = const Service();

  Future<List<League>> leagues() async {

    final leagues = await _service.getLeagues();

    return leagues;

  }


   Future<List<Fixtures>> fixtures(String leagueID) async {

    final fixtures = await _service.getFixtures(leagueID);

    return fixtures;

  }


  Future<List<Team>> teams(int leagueID) async {

    final teams = await _service.getTeams(leagueID);

    return teams;

  }

  Future<List<TopScorers>> topscorers(int leagueID) async {

    final topscorers = await _service.getTopScorers(leagueID);

    return topscorers;

  }


}
