import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/fixtures/view/widgets/state_empty.dart';
import 'package:soccer_app/leagues/cubit/league_cubit.dart';
import 'package:repository/repository.dart';
import 'package:soccer_app/leagues/view/widgets/route.dart';

class LeagueScreen extends StatelessWidget {
  const LeagueScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          case LeaguesStatus.success:
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 25, 52, 99),
              appBar: AppBar(
                title: const Text('Leagues'),
                backgroundColor: const Color.fromARGB(255, 25, 52, 99),
              ),
              body: ListView.builder(
                itemCount: state.leagues.length,
                itemBuilder: (context, index) {
                  final league = state.leagues[index];
                  return ListTile(
                    title: Text(league.leagueName),
                    subtitle: Text(league.countryName),
                    onTap: () {
                      Navigator.push(context, createRoute(context, league));
                    },
                    
                  );
                },
              ),
              
            );

          case LeaguesStatus.failure:
            return const EmptyState();
        }
      },
    );
  }
}