import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/fixtures/view/screens/premier.dart';
import 'package:soccer_app/leagues/cubit/league_cubit.dart';
import 'package:repository/repository.dart';
import 'package:soccer_app/teams/teams_cubit.dart';
import 'package:soccer_app/fixtures/view/widgets/state_empty.dart';
import 'package:soccer_app/teams/view/teams.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LeagueCubit(context.read<Repository>())..getLeagues(),
      child: const LeagueView(),
    );
  }
}

// ignore: must_be_immutable
class LeagueView extends StatelessWidget {
  const LeagueView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueCubit, LeagueState>(
      builder: (context, state) {
        switch (state.status) {
          case LeaguesStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case LeaguesStatus.success:
            return Column(
              children: [
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  
                ),
                Expanded(
                      child: GridView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: state.leagues.length,
                          gridDelegate:
                          
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            final league = state.leagues[index];
                            return InkWell(
                              onTap: () {
                                

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => TeamsCubit(
                                          context.read<Repository>()),
                                      child: TeamsPage(
                                        leagueID: league.leagueKey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.network(league.leagueLogo),
                                    Text(league.leagueName),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
              ],
            );

          // children: state.leagues.map((league) => Image.network(league.leagueLogo, fit: BoxFit.cover,)).toList());
          case LeaguesStatus.failure:
            return const Center(child: Text('failed to fetch leagues'));
        }
      },
    );
  }
}
