import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/blocs/bloc_bottom_navigation/bottom_navigation_bloc.dart';



//create a custom bottom navigation with bloc patternS
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
              icon: Icon(Icons.emoji_events_sharp),
              label: 'Teams',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Leagues',
            ),
          ],
        );
      },
    );
  }
}
