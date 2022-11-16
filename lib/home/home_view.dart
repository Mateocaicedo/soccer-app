import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/bloc_bottom_navigation/bottom_navigation_bloc.dart';
import 'package:soccer_app/fixtures/view/fixtures.dart';
import 'package:soccer_app/leagues/view/leagues_home.dart';
import 'custom_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc,int>(
        builder: (context, state) {
          switch (state) {
            case 0:
              return const FixturesPage();
            case 1:
              return const LeaguesPage();
            case 2:
              return const Center(child: Text('Players'));
            default:
              return const Center(child: Text('Fixtures'));
          }
        },
          

      ),
      bottomNavigationBar:  const CustomBottomNavigationBar(),
    );
  }
}
