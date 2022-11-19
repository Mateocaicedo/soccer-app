import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/teams/view/widgets/card_teams.dart';
import 'package:soccer_app/blocs/bloc_teams/teams_cubit.dart';
import 'package:repository/repository.dart';
import 'package:flutter/material.dart';

import '../../../widgets/state_empty.dart';

class SerieAScreen extends StatelessWidget {
  const SerieAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TeamsCubit(context.read<Repository>())..getTeams(207),
      child: const SerieAView(),
    );
  }
}

class SerieAView extends StatelessWidget {
  const SerieAView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TeamsCubit, TeamsState>(
        builder: (context, state) {
          switch (state.status) {
            case TeamsStatus.loading:
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            case TeamsStatus.success:
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final team = state.teams[index];
                  return TeamCard(team: team);
                },
                itemCount: state.teams.length,
              );

            case TeamsStatus.failure:
              return const EmptyState(message: "There are no teams",);
          }
        },
      ),
    );
  }
}
