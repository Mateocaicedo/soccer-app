import 'package:flutter/material.dart';

import 'package:repository/src/models/team.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({super.key, required this.team});
  final Team team;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              team.teamLogo,
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            Container(
              
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: const BoxDecoration(
                color:  Color.fromARGB(255, 25, 52, 99),
                borderRadius: BorderRadius.all( Radius.circular(20)),
              ),
              child: Text(
                team.teamName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,

                ),
              ),
            ),
          ]),
    );
  }
}
