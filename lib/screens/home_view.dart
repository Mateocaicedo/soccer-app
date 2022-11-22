import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/blocs/bloc_bottom_navigation/bottom_navigation_bloc.dart';
import 'package:soccer_app/screens/fixtures/view/fixtures_home.dart';
import 'package:soccer_app/screens/leagues/leagues_home.dart';
import 'package:soccer_app/screens/teams/view/teams_home.dart';

import 'widgets/custom_bottom_navigation.dart';


//create a home screen that displays the bottom navigation bar and the pages
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins",
          
        ),
      home: Scaffold(
        
        body: BlocBuilder<BottomNavigationBloc,int>(
          builder: (context, state) {
            switch (state) {
              case 0:
                return const FixturesPage();
              case 1:
                return const TeamScreen();
              case 2:
                return const LeagueScreen();
              default:
                return const Center(child: Text(''));
            }
          },
            
    
        ),
        bottomNavigationBar:  const CustomBottomNavigationBar(),
      ),
    );
  }
}
