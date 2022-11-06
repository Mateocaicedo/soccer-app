part of 'home_cubit.dart';

enum HomeStatus {loading, success, failure }

class HomeState{
  HomeState({
    this.status = HomeStatus.loading,
    this.leagues = const <League>[],
  });

  final HomeStatus status;
  final List<League> leagues;

  HomeState copyWith({
    HomeStatus? status,
    List<League>? leagues,
  }) {
    return HomeState(
      status: status ?? this.status,
      leagues: leagues ?? this.leagues,
    );
  }

}
