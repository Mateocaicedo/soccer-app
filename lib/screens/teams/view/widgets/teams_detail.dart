

import 'package:flutter/material.dart';
import 'package:repository/src/models/team.dart';
import 'package:cached_network_image/cached_network_image.dart';


//create a team detail screen that will display the team details like players
class TeamsDetailScreen extends StatelessWidget {
  const TeamsDetailScreen({super.key, required this.team});
  final Team team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 52, 99),
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(children: [
            _container(),
            const SizedBox(
              height: 11,
            ),
            const Divider(
              color: Colors.amber,
              thickness: 2,
              indent: 8,
              endIndent: 8,
            ),
            _buildSizedBox()
          ]),
        ),
      ),
    );
  }

  Image _getImage() {
    try {
      var image = Image.network(
        team.teamLogo,
        fit: BoxFit.contain,
      );
      return image;
    } catch (e) {
      return const Image(
        image: AssetImage(
          'assets/default_player.jpg',
        ),
        fit: BoxFit.contain,
      );
    }
  }


  //create a container that contains the team logo and name
  Container _container() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 150, maxWidth: 200),
              child: Image.network(
                team.teamLogo,
                fit: BoxFit.contain,
              )),
              
          Text(
            team.teamName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  //create an appbar widget
  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: const Color.fromARGB(255, 25, 52, 99),
      shape: const Border(bottom: BorderSide(color: Colors.amber, width: 2)),
      title: Text(
        team.teamName,
        style: const TextStyle(color: Colors.amber),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.amber,
        ),
      ),
    );
  }

  //create a sized box that show a list of players
  SizedBox _buildSizedBox() {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: team.players.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3.0),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.amber))),
            child: ListTile(
              title: Text(
                team.players[index].playerName,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(team.players[index].playerType,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 235, 226, 226))),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  team.players[index].playerImage,
                ),
              ),
              trailing: Text(team.players[index].playerNumber,
                  style: const TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}
