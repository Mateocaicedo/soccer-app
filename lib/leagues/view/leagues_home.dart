import 'package:flutter/material.dart';
import 'package:soccer_app/leagues/view/league.dart';
class LeaguesPage extends StatelessWidget {
  const LeaguesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 52, 99),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 25, 52, 99),
          elevation: 2,
          title: Row(children: const [
            Icon(
              Icons.emoji_events,
              color: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'LEAGUES',
              style: TextStyle(color: Colors.amber),
            ),
          ]),
        ),
        body: const LeaguePage(),
      ),
    );
  }
}
