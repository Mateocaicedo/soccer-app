import 'package:repository/src/models/league.dart';
import 'package:flutter/material.dart';
import 'package:soccer_app/teams/view/screens/teams_detail.dart';

import '../screens/leagues_detail.dart';

MaterialPageRoute createRoute(context, League team) {
  return MaterialPageRoute(
    builder: (context) => LeagueDetailScreen(),
  );
}