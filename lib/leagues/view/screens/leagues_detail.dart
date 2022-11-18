

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/widgets/state_empty.dart';
import 'package:soccer_app/topscorers_bloc/cubit/topscorers_cubit.dart';
import 'package:repository/src/models/league.dart';
import 'package:repository/src/models/topscorers.dart';
import 'package:repository/repository.dart';
import 'package:flutter/material.dart';



class LeagueDetailScreen extends StatelessWidget {
  const LeagueDetailScreen({super.key,required this.league});
  final League league;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => TopscorersCubit(context.read<Repository>())..getTopscorers(int.parse(league.leagueKey)),
      child:  LeagueDetailView(league: league),);
  }
}

class LeagueDetailView extends StatelessWidget {
  const LeagueDetailView({super.key, required this.league});
  final League league;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopscorersCubit, TopscorersState>(
      builder: (context, state) {
        switch (state.status) {
          case TopScorersStatus.loading:
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          case TopScorersStatus.success:
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 25, 52, 99),
              appBar: _appBar(context),
              body: ListView.builder(
                itemCount: state.topscorers.length,
                itemBuilder: (context, index) {
                  final topscorer = state.topscorers[index];
                  return ListTile(
                    title: Text(topscorer.playerName),
                    subtitle: Text(topscorer.teamName),
                    onTap: () {
                      // Navigator.push(context, createRoute(context, league));
                    },
                    
                  );
                },
              ),
              
            );

          case TopScorersStatus.failure:
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 25, 52, 99),
              appBar: _appBar(context),
              body: const EmptyState(message: "No Top Scorers"),
            );
            
        }
      },
    );
  }
  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: const Color.fromARGB(255, 25, 52, 99),
      shape: const Border(bottom: BorderSide(color: Colors.amber, width: 2)),
      title: Text(
        "Top Scorers in ${league.leagueName}",
        style: const TextStyle(color: Colors.amber,
        overflow: TextOverflow.ellipsis),
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
}
