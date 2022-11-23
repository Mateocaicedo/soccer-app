import 'package:flutter/material.dart';
import 'package:repository/src/models/team.dart';
import 'package:soccer_app/screens/teams/view/widgets/route.dart';
import 'package:soccer_app/resources/colors.dart';


//create a team card that displays team name and logo
class TeamCard extends StatelessWidget {
  const TeamCard({super.key, required this.team});
  final Team team;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      
      
      onTap: () {
        Navigator.push(context, createRoute(context, team));
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: size.height * 0.2, maxWidth: size.width * 0.3),
                child: Image.network(
                  team.teamLogo,
                  fit: BoxFit.contain,
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  team.teamName.split(" ").length > 1
                      ? "${team.teamName.split(" ")[0]} ${team.teamName.split(" ")[1][0]}"
                      : team.teamName,
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
