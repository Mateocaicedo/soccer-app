import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/fixtures/cubit/fixtrures_cubit.dart';
import 'package:soccer_app/home/cubit/home_cubit.dart';
import 'package:repository/repository.dart';

class FixturesPage extends StatelessWidget {
  final Key key;
  const FixturesPage({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FixtruresCubit(context.read<Repository>())..getFixtures(),
      child: const FixturesView(
        key: Key('FixturesPage'),
      ),
    );
  }
}

class FixturesView extends StatelessWidget {
  const FixturesView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixtruresCubit, FixtruresInitial>(
      builder: (context, state) {
        switch (state.status) {
          case FixturesStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case FixturesStatus.success:
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    // ignore: prefer_const_constructors
                    bottom: TabBar(tabs: [
                      Tab(text: 'Premier League'),
                      Tab(text: 'La Liga'),
                      Tab(text: 'Serie A'),
                      Tab(text: 'Bundesliga'),
                    ]),
                  ),
                body: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: state.fixtures.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.fixtures[index].awayTeamKey),
                          subtitle: Text(state.fixtures[index].awayTeamLogo),
                        );
                      },
                    )    
                  ],
                ),
              ),
            ),
          );


          case FixturesStatus.failure:
            return const Center(child: Text('failed to fetch leagues'));
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
