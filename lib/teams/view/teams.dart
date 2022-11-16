import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/fixtures/view/screens/premier.dart';
import 'package:soccer_app/leagues/cubit/league_cubit.dart';
import 'package:repository/repository.dart';
import 'package:soccer_app/teams/teams_cubit.dart';
import 'package:soccer_app/fixtures/view/widgets/state_empty.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key, required this.leagueID});
  final String leagueID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TeamsCubit(context.read<Repository>())..getTeams(leagueID),
      child: const TeamsView(),
    );
  }
}


class TeamsView extends StatelessWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: BlocBuilder<TeamsCubit, TeamsState>(
        builder: (context, state) {
          if (state.status == TeamsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == TeamsStatus.success) {
            return ListView.builder(
              itemCount: state.teams.length,
              itemBuilder: (context, index) {
                final team = state.teams[index];
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Padding(padding: const EdgeInsets.all(8.0),
                            child: Image.network(team.teamLogo,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                         
                        ],
                      )
                    ]
                  ),
                );
              },
            );
          } else {
            return const EmptyState();
          }
        },
      
        ),
      );
  } 
}