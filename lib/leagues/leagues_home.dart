import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/fixtures/view/widgets/state_empty.dart';
import 'package:soccer_app/leagues/cubit/league_cubit.dart';
import 'package:repository/repository.dart';

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
    return Expanded(
      child: BlocBuilder<LeagueCubit, LeagueState>(
        builder: (context, state) {
          switch (state.status) {
            case LeaguesStatus.loading:
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            case LeaguesStatus.success:
              return ListView.builder(
                itemBuilder: (context, index) {
                  final league = state.leagues[index];
                  return ListTile(
                    title: Text(league.leagueName),
                    subtitle: Text(league.countryName),
                  );
                },
                itemCount: state.leagues.length,
              );

            case LeaguesStatus.failure:
              return const EmptyState();
          }
        },
      ),
    );
  }
}