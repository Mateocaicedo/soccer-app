import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/blocs/bloc_fixtures/fixtures_cubit.dart';
import 'package:soccer_app/widgets/state_empty.dart';

import 'package:repository/repository.dart';
import 'package:soccer_app/fixtures/view/widgets/fixture_card.dart';

class AllLeaguesPage extends StatelessWidget {
  const AllLeaguesPage({Key? key, required this.leagueId}) : super(key: key);
  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FixturesCubit(context.read<Repository>())..getFixtures(leagueId),
      child: const AllLeaguesView(),
    );
  }
}

class AllLeaguesView extends StatelessWidget {
  const AllLeaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixturesCubit, FixturesInitial>(
      builder: (context, state) {
        switch (state.status) {
          case FixturesStatus.loading:
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          case FixturesStatus.success:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.fixtures.length,
                itemBuilder: (context, index) {
                  final fixture = state.fixtures[index];
                  return FixtureCard(fixture: fixture);
                },
              ),
            );

          case FixturesStatus.failure:
            return const EmptyState(
              message: "There are no fixtures",
            );
        }
      },
    );
  }
}