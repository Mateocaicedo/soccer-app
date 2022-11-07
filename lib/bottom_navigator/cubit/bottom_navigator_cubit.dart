import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigator_state.dart';

class BottomNavigatorCubit extends Cubit<BottomNavigatorState> {
  BottomNavigatorCubit() : super(BottomNavigatorInitial());
}
