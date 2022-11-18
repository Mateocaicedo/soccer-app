
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/teams/teams_bloc/teams_cubit.dart';
import 'package:repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:repository/src/models/team.dart';

import '../../../widgets/state_empty.dart';
import '../widgets/card_teams.dart';

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key, required this.leagueId});
  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TeamsCubit(context.read<Repository>())..getTeams(leagueId),
      child: const LeagueView(),
    );
  }
}

class LeagueView extends StatefulWidget {
  const LeagueView({super.key});

  @override
  State<LeagueView> createState() => _LeagueViewState();
}

class _LeagueViewState extends State<LeagueView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        
        body: _buildBlocBuilder()
      ),
    );
  }

  Widget _buildGridView(List<Team> teams) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final team = teams[index];
        return TeamCard(team: team);
      },
      itemCount: teams.length,
    );
  }

  Widget _buildBlocBuilder(){
    return BlocBuilder<TeamsCubit, TeamsState>(
      builder: (context, state) {
        switch (state.status) {
          case TeamsStatus.loading:
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          case TeamsStatus.success:
            return _buildGridView(state.teams);

          case TeamsStatus.failure:
            return const EmptyState(message: "There are no teams",);
        }
      },
    );
  }
}