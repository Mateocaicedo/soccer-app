import 'package:flutter/material.dart';
import 'package:soccer_app/resources/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/widgets/state_empty.dart';
import 'package:soccer_app/blocs/bloc_leagues/league_cubit.dart';
import 'package:repository/repository.dart';
import 'package:soccer_app/leagues/view/widgets/route.dart';
import 'package:repository/src/models/league.dart';

class LeagueScreen extends StatelessWidget {
  const LeagueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LeagueCubit(context.read<Repository>())..getLeagues(),
      child: const LeagueView(),
    );
  }
}

class LeagueView extends StatefulWidget {
  const LeagueView({super.key});

  @override
  State<LeagueView> createState() => _LeagueViewState();
}

class _LeagueViewState extends State<LeagueView> {
  late List<League> _leagues;
  late List<League> _filteredLeagues;

  bool _isSearching = false;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  Widget _buildSearchField() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: _searchController,
      decoration: const InputDecoration(
        hintText: 'Search league',
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        border: InputBorder.none,
      ),
      onChanged: (text) {
        _searchLeague(text);
      },
    );
  }

  BlocBuilder _buildBlocWidget() {
    return BlocBuilder<LeagueCubit, LeagueState>(
      builder: (context, state) {
        switch (state.status) {
          case LeaguesStatus.loading:
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          case LeaguesStatus.success:
            _leagues = state.leagues;
            return _buildListViewBuilder();

          case LeaguesStatus.failure:
            return const EmptyState(
              message: "There are no leagues",
            );
        }
      },
    );
  }

  Widget _buildListViewBuilder() {
    //create a widget refresh indicator to refresh the list
    
    return ListView.builder(
      itemCount: _searchController.text.isEmpty
          ? _leagues.length
          : _filteredLeagues.length,
      itemBuilder: (context, index) {
        final league = _searchController.text.isEmpty
            ? _leagues[index]
            : _filteredLeagues[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              league.leagueLogo,
            ),
          ),
          title: Text(
            league.leagueName,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            league.countryName,
            style: const TextStyle(color: Colors.amber),
          ),
          onTap: () {
            Navigator.push(context, createRoute(context, league));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          // leading: _isSearching ? const BackButton(color: Color.fromARGB(255, 80, 44, 44)) : Container(),
          title: _isSearching
              ? _buildSearchField()
              : Row(
                  children: const [
                    Icon(
                      Icons.emoji_events,
                      color: AppColors.secondaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'LEAGUES',
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ],
                ),
          backgroundColor: const Color.fromARGB(255, 25, 52, 99),
          actions: _buildAppBarActions(),
          shape:
              const Border(bottom: BorderSide(color: AppColors.secondaryColor, width: 2)),
        ),
        body: _buildBlocWidget());
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            setState(() {
              _clearSearch();
              Navigator.pop(context);
            });
          },
        )
      ];
    } else {
      return [
        IconButton(icon: const Icon(Icons.search), onPressed: _startSearch)
      ];
    }
  }

  void _searchLeague(String query) {
    _filteredLeagues = _leagues
        .where((league) =>
            league.leagueName.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {

      _stopSearching();
    }));
    
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }
}
