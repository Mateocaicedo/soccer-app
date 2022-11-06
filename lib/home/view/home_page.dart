import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/home/cubit/home_cubit.dart';
import 'package:repository/repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => HomeCubit(context.read<Repository>())..getLeagues(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case HomeStatus.success:
              return GridView.count(
                crossAxisCount: 2, 
                children: state.leagues.map((league) => Image.network(league.leagueLogo, fit: BoxFit.cover,)).toList());
            case HomeStatus.failure:
              return const Center(child: Text('failed to fetch leagues'));
          }

          
        },
      ),
    );
  }
}
