import 'package:flutter/material.dart';
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
                body: TabBarView(
                    children: [
                    const PremierPage(key: Key('PremierPage')),
                    const SerieAPage(key: Key('SerieAPage')),
                    Center( child: Text('Serie A')),
                    Center( child: Text('Bundesliga')),
                    Center( child: Text('Liga BetPlay')),

                  ],
                ),
              ),
            ),
          );
  
  }
}