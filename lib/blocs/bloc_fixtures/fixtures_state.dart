part of 'fixtures_cubit.dart';


enum FixturesStatus {loading, success, failure }

class FixturesInitial {
  FixturesInitial({
    this.status = FixturesStatus.loading,
    this.fixtures = const <Fixtures>[],
  });

  final FixturesStatus status;
  final List<Fixtures> fixtures;

  FixturesInitial copyWith({
    FixturesStatus? status,
    List<Fixtures>? fixtures,
  }) {
    return FixturesInitial(
      status: status ?? this.status,
      fixtures: fixtures ?? this.fixtures,
    );
  }


}
