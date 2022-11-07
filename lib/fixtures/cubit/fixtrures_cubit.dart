import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repository/src/models/fixtures.dart';
import 'package:repository/repository.dart';

part 'fixtrures_state.dart';

class FixtruresCubit extends Cubit<FixtruresInitial> {
  FixtruresCubit(this.fixtures) : super(FixtruresInitial());
  
  final Repository fixtures;


  Future<void> getFixtures() async {
    emit(state.copyWith(status: FixturesStatus.loading));
    try {
      final fix = await fixtures.fixtures();
      emit(state.copyWith(status: FixturesStatus.success, fixtures: fix));
    } catch (e) {
      emit(state.copyWith(status: FixturesStatus.failure));
    }
  }
  
}
