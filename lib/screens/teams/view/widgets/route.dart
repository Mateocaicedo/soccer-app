import 'package:repository/src/models/team.dart';
import 'package:flutter/material.dart';
import 'package:soccer_app/screens/teams/view/widgets/teams_detail.dart';


//create a material page route for team details
MaterialPageRoute createRoute(context, Team team) {
  return MaterialPageRoute(
    builder: (context) => TeamsDetailScreen(team: team),
  );
}
