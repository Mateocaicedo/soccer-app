import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/bloc/dropdown_bloc.dart';
import 'package:soccer_app/fixtures/view/screens/premier.dart';
import 'package:soccer_app/leagues/cubit/league_cubit.dart';
import 'package:repository/repository.dart';
import 'package:soccer_app/teams/teams_cubit.dart';
import 'package:soccer_app/fixtures/view/widgets/state_empty.dart';
import 'package:soccer_app/leagues/view/world_cup.dart';
import 'package:soccer_app/leagues/custom_dropdown.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownBloc(),
      child: const LeagueView(),
    );
  }
}

class LeagueView extends StatelessWidget {
  const LeagueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 52, 99),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 52, 99),
        title: const Text(
          'Leagues',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Column(
        children: [
          const CustomDropdown(),
          // BlocBuilder<DropdownBloc, String>(builder: ((context, state) {
          //   switch (state) {
          //     case 'World Cup':
          //       return const Expanded(child:  WorldCupPage());
          //     default:
          //       return const WorldCupPage();
          //   }
          // }))
        ],
      ),
    );
  }
}

// class LeagueView extends StatelessWidget {
//   const LeagueView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LeagueCubit, LeagueState>(
//       builder: (context, state) {
//         switch (state.status) {
//           case LeaguesStatus.loading:
//             return const Center(child: CircularProgressIndicator());
//           case LeaguesStatus.success:
//             return Scaffold(
//                 backgroundColor: const Color.fromARGB(255, 25, 52, 99),
//                 appBar: AppBar(
//                   backgroundColor: const Color.fromARGB(255, 25, 52, 99),
//                   title: const Text(
//                     'Leagues',
//                     style: TextStyle(color: Colors.amber),
//                   ),
//                 ),
//                 body: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: BlocBuilder<DropdownBloc, String>(
//                         builder: (context, state) {
//                           return const CustomDropdown();
//                         },
//                       ),
//                     ),

//                     // Expanded(
//                     //   child: GridView.builder(
//                     //       padding: const EdgeInsets.all(8.0),
//                     //       itemCount: state.leagues.length,
//                     //       gridDelegate:

//                     //           const SliverGridDelegateWithFixedCrossAxisCount(
//                     //             mainAxisSpacing: 8.0,
//                     //             crossAxisSpacing: 8.0,
//                     //         crossAxisCount: 2,
//                     //       ),
//                     //       itemBuilder: (context, index) {
//                     //         final league = state.leagues[index];
//                     //         return Card(

//                     //           child: Container(
//                     //             width: 200,
//                     //             height: 100,
//                     //             child: Column(
//                     //               children: [
//                     //                 Text(league.leagueName),
//                     //                 Text(league.leagueLogo),
//                     //               ],
//                     //             ),
//                     //           ),
//                     //         );
//                     //       }),
//                     // ),
//                   ],
//                 ));

//           // children: state.leagues.map((league) => Image.network(league.leagueLogo, fit: BoxFit.cover,)).toList());
//           case LeaguesStatus.failure:
//             return const Center(child: Text('failed to fetch leagues'));
//         }
//       },
//     );
//   }
// }
