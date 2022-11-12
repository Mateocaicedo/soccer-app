import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/leagues/cubit/league_cubit.dart';
import 'package:repository/repository.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LeagueCubit(context.read<Repository>())..getLeagues(),
      child: const LeagueView(),
    );
  }
}

class LeagueView extends StatelessWidget {
  const LeagueView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueCubit, LeagueState>(
      builder: (context, state) {
        switch (state.status) {
          case LeaguesStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case LeaguesStatus.success:
            return Scaffold(
                backgroundColor: const Color.fromARGB(255, 25, 52, 99),
                appBar: AppBar(
                  title: const Text('Leagues'),
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          labelText: 'Select a League',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        items: state.leagues.map((league) {
                          return DropdownMenuItem(
                            value: league.leagueName,
                            child: Text(league.leagueName),
                          );
                        }).toList(),
                        onChanged: (value) {
                          context.read<LeagueCubit>().getLeagues();
                        },
                      ),
                    ),
                    
                    Expanded(
                      child: GridView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: state.leagues.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            final league = state.leagues[index];
                            return Card(

                              child: Container(
                                width: 200,
                                height: 100,
                                child: Column(
                                  children: [
                                    Text(league.leagueName),
                                    Text(league.leagueLogo),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),

                    
                  ],
                ));

          // children: state.leagues.map((league) => Image.network(league.leagueLogo, fit: BoxFit.cover,)).toList());
          case LeaguesStatus.failure:
            return const Center(child: Text('failed to fetch leagues'));
        }
      },
    );
  }
}
