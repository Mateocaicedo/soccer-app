
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:repository/repository.dart';
import 'package:soccer_app/teams/teams_cubit.dart';
import 'package:soccer_app/fixtures/view/widgets/state_empty.dart';

class WorldCupPage extends StatelessWidget {
  const WorldCupPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TeamsCubit(context.read<Repository>())..getTeams("28"),
      child: const WorldCupView(),
    );
  }

  
}



class WorldCupView extends StatelessWidget {
  const WorldCupView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamsCubit,TeamsState>(
      builder: (context, state) {
        switch (state.status) {
          case TeamsStatus.loading:
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          case TeamsStatus.success:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.teams.length,
                itemBuilder: (context, index) {
                  final team = state.teams[index];
                  return ListTile(
                    title: Text(team.teamName),
                    
                  );
                },
              ),
            );

          case TeamsStatus.failure:
            return const EmptyState();
        }
      },
    );
  }
}