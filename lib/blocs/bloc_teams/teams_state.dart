part of 'teams_cubit.dart';

enum TeamsStatus { loading, success, failure }

class TeamsState {
  TeamsState({
    this.status = TeamsStatus.loading,
    this.teams = const <Team>[],
  });

  final TeamsStatus status;
  
  List<Team> teams;

  TeamsState copyWith({
    TeamsStatus? status,
    List<Team>? teams,
  }) {
    return TeamsState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
    );
  }
}