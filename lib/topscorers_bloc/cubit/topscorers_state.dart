part of 'topscorers_cubit.dart';

enum TopScorersStatus {loading, success, failure }

class TopscorersState extends Equatable {
  const TopscorersState({
    this.topscorers = const <TopScorers>[],
    this.status = TopScorersStatus.loading,
  });

  final TopScorersStatus status;
  final List<TopScorers> topscorers;


  TopscorersState copyWith({
    TopScorersStatus? status,
    List<TopScorers>? topscorers,
  }) {
    return TopscorersState(
      status: status ?? this.status,
      topscorers: topscorers ?? this.topscorers,
    );
  }

  @override
  List<Object> get props => [topscorers, status];
}
