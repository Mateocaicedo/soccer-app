import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  
}
