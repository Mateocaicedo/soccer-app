import 'package:repository/src/models/team.dart';
import 'package:flutter/material.dart';
import 'package:soccer_app/leagues/view/widgets/teams_detail.dart';

MaterialPageRoute createRoute(context, Team team) {
  return MaterialPageRoute(
    builder: (context) => TeamsDetailScreen(team: team),
  );
}