
import 'package:flutter/material.dart';
import 'package:soccer_app/leagues/leagues_home.dart';
import 'package:soccer_app/teams/view/screens/bundesliga_screen.dart';
import 'package:soccer_app/teams/view/screens/laliga_screen.dart';
import 'package:soccer_app/teams/view/screens/ligabet_screen.dart';
import 'package:soccer_app/teams/view/screens/premier_screen.dart';
import 'package:soccer_app/teams/view/screens/seriea_screen.dart';
import 'package:soccer_app/teams/view/screens/worldcup_screen.dart';
import 'package:soccer_app/teams/view/screens/league_screen.dart';


class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  final _leaguesMap = {
    'Premier League': 152,
    'World Cup': 28,
    'La Liga': 302,
    'Serie A': 207,
    'Bundesliga': 175,
    'Liga BetPlay': 120,
  };
  

  var selectedLeague = 'Premier League';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 25, 52, 99),
          shape: const Border(bottom: BorderSide(color: Colors.amber, width: 2)),
          title: Row(children: const [
            Icon(
              Icons.sports_soccer_sharp,
              color: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'TEAMS',
              style: TextStyle(color: Colors.amber),
            ),
          ]),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 52, 99),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dropdownButton(),
              const SizedBox(height: 15),
              const Text(
                "Teams: ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 15),
              // if (selectedLeague == 'Premier League')
              //         LeaguesScreen(leagueId: 152)
              // else if (selectedLeague == 'World Cup')
              //        LeaguesScreen(leagueId: 28)
              // else if (selectedLeague == 'La Liga')
              //        LeaguesScreen(leagueId: 302)
              // else if (selectedLeague == 'Serie A')
              //   const SerieAScreen()
              // else if (selectedLeague == 'Bundesliga')
              //   const BundesligaScreen()
              // else if (selectedLeague == 'Liga BetPlay')
              //   const LigaBetPlayScreen()
              // else
              //   const PremierScreen()
              if (selectedLeague == 'Premier League')
                const PremierScreen()
              else if (selectedLeague == 'World Cup')
                const WorldCupScreen()
              else if (selectedLeague == 'La Liga')
                const LaLigaScreen()
              else if (selectedLeague == 'Serie A')
                const SerieAScreen()
              else if (selectedLeague == 'Bundesliga')
                const BundesligaScreen()
              else if (selectedLeague == 'Liga BetPlay')
                const LigaBetPlayScreen()
              else
                const PremierScreen()
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem> _dropdownItems() {
    return _leaguesMap.keys
        .map((leagues) => DropdownMenuItem(
              value: leagues,
              child: Text(
                leagues,
              ),
            ))
        .toList();
  }

  void _getLeague(Map<String, int> league) async {
    try {
      if (league.keys.first != selectedLeague) {
        setState(() {
          selectedLeague = league.keys.first;
        });
      }
    } catch (error) {
      // Show a snackbar to notify the user that there was an error
      final snackBar = SnackBar(content: Text(error.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _dropdownButton() {
    return DropdownButtonFormField<dynamic>(
      iconSize: 30,
      iconEnabledColor: Colors.black,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontFamily: "Poppins"),
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      items: _dropdownItems(),
      value: 'Premier League',
      onChanged: (value) {
        switch (value) {
          case 'Premier League':
            _getLeague({'Premier League': 152});

            break;
          case 'World Cup':
            _getLeague({'World Cup': 28});
            break;
          case 'La Liga':
            _getLeague({'La Liga': 302});
            break;
          case 'Serie A':
            _getLeague({'Serie A': 207});
            break;
          case 'Bundesliga':
            _getLeague({'Bundesliga': 175});
            break;
          case 'Liga BetPlay':
            _getLeague({'Liga BetPlay': 120});
            break;
          default:
            _getLeague({'Premier League': 152});
        }
      },
    );
  }
}
