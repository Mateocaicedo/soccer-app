part of 'fixtrures_cubit.dart';


enum FixturesStatus {loading, success, failure }

class FixtruresInitial {
  FixtruresInitial({
    this.status = FixturesStatus.loading,
    this.fixtures = const <Fixtures>[],
  });

  final FixturesStatus status;
  final List<Fixtures> fixtures;

  FixtruresInitial copyWith({
    FixturesStatus? status,
    List<Fixtures>? fixtures,
  }) {
    return FixtruresInitial(
      status: status ?? this.status,
      fixtures: fixtures ?? this.fixtures,
    );
  }


}
