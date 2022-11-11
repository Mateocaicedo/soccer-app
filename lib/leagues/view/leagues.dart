import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/leagues/cubit/league_cubit.dart';
import 'package:repository/repository.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => LeagueCubit(context.read<Repository>())..getLeagues(),
      child: const LeagueView(),
    );
  }
}

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
              return GridView.count(
                crossAxisCount: 2,
                children: state.leagues.map((league) => Card(
                  child: Column(
                    children: [
                      Text(league.leagueKey),
                      Text(league.leagueName),
                    ],
                  ),
                )).toList());
                // children: state.leagues.map((league) => Image.network(league.leagueLogo, fit: BoxFit.cover,)).toList());
            case LeaguesStatus.failure:
              return const Center(child: Text('failed to fetch leagues'));
          }
        },
      );
  }
}
