import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/fixtures/cubit/fixtures_cubit.dart';
import 'package:soccer_app/home/cubit/home_cubit.dart';
import 'package:repository/repository.dart';
import 'package:soccer_app/fixtures/view/widgets/fixture_card.dart';

class FixturesPage extends StatelessWidget {
  final Key key;
  const FixturesPage({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FixturesCubit(context.read<Repository>())..getFixtures(),
      child: const FixturesView(
        key: Key('FixturesPage'),
      ),
    );
  }
}

class FixturesView extends StatelessWidget{
  const FixturesView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixturesCubit, FixturesInitial>(
      builder: (context, state) {
        switch (state.status) {
          case FixturesStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case FixturesStatus.success:
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(
                length: 5,
                child: Scaffold(
                  backgroundColor: const Color.fromARGB(255, 25, 52, 99),
                  appBar: AppBar(
                    
                    title: const Text('League'),
                    backgroundColor: const Color.fromARGB(255, 25, 52, 99),
                    bottom: const TabBar(
                      isScrollable: true,
                      labelColor: Colors.amber,
                      indicatorColor: Colors.amber,
                      unselectedLabelColor: Colors.white,
                      tabs: [
                      Tab(text: 'Premier League'),
                      Tab(text: 'La Liga'),
                      Tab(text: 'Serie A'),
                      Tab(text: 'Bundesliga'),
                      Tab(text: 'Liga BetPlay'),

                      
                    ]),
                  ),
                body: TabBarView(
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: state.fixtures.length,
                        itemBuilder: (context, index) {
                          
                          final fixture = state.fixtures[index];
                          print("${fixture.eventHomeTeam} ${fixture.eventFinalResult}");
                          print(fixture.eventDate.toString().substring(0,10));
                          print(fixture.eventStatus);
                          return FixtureCard(fixture: fixture);
                        },
                      ),
                    ),
                    
                    Center( child: Text('La Liga')),
                    Center( child: Text('Serie A')),
                    Center( child: Text('Bundesliga')),
                    Center( child: Text('Liga BetPlay')),

                  ],
                ),
              ),
            ),
          );


          case FixturesStatus.failure:
            return const Center(child: Text('failed to fetch fixtures'));
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
