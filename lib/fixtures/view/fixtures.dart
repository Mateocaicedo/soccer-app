import 'package:flutter/material.dart';
import 'package:soccer_app/fixtures/view/screens/bundesliga.dart';
import 'package:soccer_app/fixtures/view/screens/la_liga.dart';
import 'package:soccer_app/fixtures/view/screens/liga_betplay.dart';
import 'package:soccer_app/fixtures/view/screens/premier.dart';
import 'package:soccer_app/fixtures/view/screens/serie_a.dart';
class FixturesPage extends StatelessWidget {
  const FixturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(
                length: 5,
                child: Scaffold(
                  backgroundColor: const Color.fromARGB(255, 25, 52, 99),
                  appBar: AppBar(
                    
                    title: const Text('League'),
                    backgroundColor: const Color.fromARGB(255, 25, 52, 99),
                    bottom: const TabBar(
                      isScrollable: true,
                      labelColor: Colors.amber,
                      indicatorColor: Colors.amber,
                      unselectedLabelColor: Colors.white,
                      tabs: [
                      Tab(text: 'Premier League'),
                      Tab(text: 'La Liga'),
                      Tab(text: 'Serie A'),
                      Tab(text: 'Bundesliga'),
                      Tab(text: 'Liga BetPlay'),

                      
                    ]),
                  ),
                body: const TabBarView(
                    children: [
                    PremierPage(key: Key('PremierPage')),
                    LaLigaPage(key: Key('LaLigaPage')),
                    SerieAPage(key: Key('SerieAPage')),
                    BundesligaPage(key: Key('BundesligaPage')),
                    LigaBetPlayPage(key: Key('LigaBetPlayPage')),

                  ],
                ),
              ),
            ),
          );
  
  }
}