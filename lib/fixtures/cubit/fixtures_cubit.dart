import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repository/src/models/fixtures.dart';
import 'package:repository/repository.dart';

part 'fixtures_state.dart';

class FixturesCubit extends Cubit<FixturesInitial> {
  FixturesCubit(this.fixtures,this.leagueID) : super(FixturesInitial());
  
  final Repository fixtures;
  final String leagueID ;

  Future<void> getFixtures() async {
    emit(state.copyWith(status: FixturesStatus.loading));
    try {
      final fix = await fixtures.fixtures(leagueID);
      emit(state.copyWith(status: FixturesStatus.success, fixtures: fix));
    } catch (e) {
      emit(state.copyWith(status: FixturesStatus.failure));
    }
  }
  
}
