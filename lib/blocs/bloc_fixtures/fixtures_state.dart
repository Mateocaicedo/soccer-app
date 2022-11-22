part of 'fixtures_cubit.dart';

//create a enum for the status of the fixtures
enum FixturesStatus {loading, success, failure }


//create a fixtures initial for the fixtures cubit
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
