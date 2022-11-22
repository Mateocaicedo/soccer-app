import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/models/topscorers.dart';

part 'topscorers_state.dart';


//create a cubit for topscorers
class TopscorersCubit extends Cubit<TopscorersState> {
  TopscorersCubit(this.topscorers) : super(TopscorersState());
  final Repository topscorers;

  //get topscorers by league id
  Future<void> getTopscorers(int leagueId) async {
    emit(state.copyWith(status: TopScorersStatus.loading));
    try {
      final topscorers = await this.topscorers.topscorers( leagueId);
      emit(state.copyWith(status: TopScorersStatus.success, topscorers: topscorers));
    } catch (e) {
      emit(state.copyWith(status: TopScorersStatus.failure));
    }
  }
}
