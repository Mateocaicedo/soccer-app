import 'package:flutter/material.dart';
import 'package:soccer_app/resources/colors.dart';

import 'package:soccer_app/fixtures/view/screens/all_leagues.dart';

class FixturesPage extends StatelessWidget {
  const FixturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            elevation: 2,
            title: Row(children: const [
              Icon(
                Icons.sports_soccer,
                color: AppColors.secondaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'FIXTURES',
                style: TextStyle(color: AppColors.secondaryColor),
              ),
            ]),
            backgroundColor: AppColors.primaryColor,
            bottom: const TabBar(
                isScrollable: true,
                labelColor: AppColors.secondaryColor,
                indicatorColor: AppColors.secondaryColor,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(text: 'Premier League'),
                  Tab(text: 'La Liga'),
                  Tab(text: 'Serie A'),
                  Tab(text: 'Bundesliga'),
                  Tab(text: 'Liga BetPlay'),
                  Tab(text: 'FIFA World Cup'),
                  
                ]),
          ),
          body: const TabBarView(
            children: [
              
              AllLeaguesPage(leagueId: 152),
              AllLeaguesPage(leagueId: 302),
              AllLeaguesPage(leagueId: 207),

              AllLeaguesPage(leagueId: 175),
              AllLeaguesPage(leagueId: 120),
              AllLeaguesPage(leagueId: 28),
              
            ],
          ),
        ),
      ),
    );
  }
}
