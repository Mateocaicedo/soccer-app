import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/bloc_bottom_navigation/bottom_navigation_bloc.dart';
import 'package:soccer_app/leagues/view/leagues.dart';
import 'package:soccer_app/fixtures/view/fixtures.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          onTap: (index) {
            context.read<BottomNavigationBloc>().add(PageTapped(index));
          },
          selectedItemColor: const Color.fromARGB(255, 25, 52, 99),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Fixtures',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: 'Leagues',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Players',
            ),
          ],
        );
      },
    );
  }
}
