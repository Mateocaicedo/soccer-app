import 'package:repository/src/models/league.dart';
import 'package:flutter/material.dart';


import '../screens/leagues_detail.dart';

MaterialPageRoute createRoute(context, League league) {
  return MaterialPageRoute(
    builder: (context) => LeagueDetailScreen(league: league,),
  );
}