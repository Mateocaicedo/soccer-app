
import 'package:flutter/material.dart';
import 'package:soccer_app/screens/leagues/leagues_home.dart';
import 'package:soccer_app/screens/teams/view/screens/bundesliga_screen.dart';
import 'package:soccer_app/screens/teams/view/screens/laliga_screen.dart';
import 'package:soccer_app/screens/teams/view/screens/ligabet_screen.dart';
import 'package:soccer_app/screens/teams/view/screens/premier_screen.dart';
import 'package:soccer_app/screens/teams/view/screens/seriea_screen.dart';
import 'package:soccer_app/screens/teams/view/screens/worldcup_screen.dart';

import 'package:soccer_app/resources/colors.dart';

//create a team screen that display a dropdown button to select a league and a grid view to display the teams
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


  Widget _buildTitle(){
    return Row(children: const [
            Icon(
              Icons.sports_soccer_sharp,
              color: AppColors.secondaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'TEAMS',
              style: TextStyle(color: AppColors.secondaryColor),
            ),
          ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          shape: const Border(bottom: BorderSide(color: AppColors.secondaryColor, width: 2)),
          title: _buildTitle()
        ),
        backgroundColor: AppColors.primaryColor,
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
              //_returnScreen(),

              if(selectedLeague == 'Premier League')
                const PremierScreen(),
              if(selectedLeague == 'World Cup')
                const WorldCupScreen(),
              if(selectedLeague == 'La Liga')
                const LaLigaScreen(),
              if(selectedLeague == 'Serie A')
                const SerieAScreen(),
              if(selectedLeague == 'Bundesliga')
                const BundesligaScreen(),
              if(selectedLeague == 'Liga BetPlay')
                const LigaBetPlayScreen(),
              
              
            ],
          ),
        ),
      );
  }

  
  //list of dropdown items
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


  //set state to change the dropdown value
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

  
  //create a dropdown button to select a league
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
