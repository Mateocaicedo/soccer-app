import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/blocs/bloc_fixtures/fixtures_cubit.dart';
import 'package:soccer_app/resources/widgets/state_empty.dart';

import 'package:repository/repository.dart';
import 'package:soccer_app/screens/fixtures/view/widgets/fixture_card.dart';
import 'package:soccer_app/resources/colors.dart';
import 'package:repository/src/models/fixtures.dart';


//create a screen that shows all fixtures for a league
class AllLeaguesPage extends StatelessWidget {
  const AllLeaguesPage({Key? key, required this.leagueId}) : super(key: key);
  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FixturesCubit(context.read<Repository>())..getFixtures(leagueId),
      child: AllLeaguesView(leagueId: leagueId),
    );
  }
}

class AllLeaguesView extends StatelessWidget {
  const AllLeaguesView({Key? key, required this.leagueId}) : super(key: key);
  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return _buildBlocBuilder(context);
  }

  //create a bloc builder to get the fixtures
  Widget _buildBlocBuilder(BuildContext context) {
    return BlocBuilder<FixturesCubit, FixturesInitial>(
      builder: (context, state) {
        switch (state.status) {
          case FixturesStatus.loading:
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          case FixturesStatus.success:
            return _buildListViewBuilder(context, state.fixtures);
          case FixturesStatus.failure:
            return const EmptyState(
              message: "There are no fixtures",
            );
        }
      },
    );
  }

  //create a listview builder to show the fixtures
  Widget _buildListViewBuilder(BuildContext context, List<Fixtures> fixtures){
    fixtures = fixtures.reversed.toList();

    return RefreshIndicator(
              strokeWidth: 3,
              displacement: 15,
              color: AppColors.primaryColor,
              backgroundColor: Colors.white,
              onRefresh: () async {
                context.read<FixturesCubit>().getFixtures(leagueId);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  
                  itemCount: fixtures.length,
                  itemBuilder: (context, index) {
                    final fixture = fixtures[index];
                    return FixtureCard(fixture: fixture);
                  },
                ),
              ),
            );
  }
}