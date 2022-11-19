import 'package:bloc/bloc.dart';

import 'package:repository/src/models/fixtures.dart';
import 'package:repository/repository.dart';

part 'fixtures_state.dart';

class FixturesCubit extends Cubit<FixturesInitial> {
  FixturesCubit(this.fixtures) : super(FixturesInitial());

  final Repository fixtures;

  Future<void> getFixtures(int leagueId) async {
    emit(state.copyWith(status: FixturesStatus.loading));
    try {
      final fix = await fixtures.fixtures(leagueId);
      emit(state.copyWith(status: FixturesStatus.success, fixtures: fix));
    } catch (e) {
      emit(state.copyWith(status: FixturesStatus.failure));
    }
  }
}
