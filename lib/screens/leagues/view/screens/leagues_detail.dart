import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:soccer_app/resources/widgets/state_empty.dart';
import 'package:soccer_app/blocs/bloc_topscorers.dart/topscorers_cubit.dart';
import 'package:repository/src/models/league.dart';
import 'package:repository/src/models/topscorers.dart';
import 'package:repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:soccer_app/resources/colors.dart';


//create a league detail screen
class LeagueDetailScreen extends StatelessWidget {
  const LeagueDetailScreen({super.key, required this.league});
  final League league;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => TopscorersCubit(context.read<Repository>())
          ..getTopscorers(int.parse(league.leagueKey)),
      ),
    ], child: LeagueDetailView(league: league));
  }
}

class LeagueDetailView extends StatelessWidget {
  const LeagueDetailView({super.key, required this.league});
  final League league;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: _appBar(context),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 25),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Player",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
              
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Goals",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          const Divider(
            color: AppColors.secondaryColor,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Expanded(child: _buildBlocBuilder()),
        ],
      ),
    );
  }


  //create a bloc builder to build the list of top scorers
  Widget _buildBlocBuilder() {
    return BlocBuilder<TopscorersCubit, TopscorersState>(
      builder: (context, state) {
        switch (state.status) {
          case TopScorersStatus.loading:
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          case TopScorersStatus.success:
            return _buildListViewBuilder(state.topscorers);

          case TopScorersStatus.failure:
            return const EmptyState(
              message: "There are no topscorers",
            );
        }
      },
    );
  }

  
  //create a list view builder to show the list of top scorers
  Widget _buildListViewBuilder(List<TopScorers> topscorers) {
    return ListView.builder(
      itemCount: topscorers.length,
      itemBuilder: (context, index) {
        final topscorer = topscorers[index];
        var count = index + 1;
        return ListTile(
          leading: Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              count.toString(),
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
          trailing: Container(
              margin: const EdgeInsets.only(right: 35),
              child: Text(
                topscorer.goals,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )),
          title: Text(
            topscorer.playerName,
            style: const  TextStyle(color: Colors.white, fontSize: 18),
          ),
          subtitle: Text(
            topscorer.teamName,
            style: const TextStyle(color: AppColors.secondaryColor, fontSize: 14),
          ),
        );
      },
    );
  }


  //create an app bar
  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: AppColors.primaryColor,
      shape: const Border(
          bottom: BorderSide(color: AppColors.secondaryColor, width: 2)),
      title: Text(
        "Top Scorers in ${league.leagueName}",
        style: const TextStyle(
            color: AppColors.secondaryColor, overflow: TextOverflow.ellipsis),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
