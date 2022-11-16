import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_event.dart';


class DropdownBloc extends Bloc<DropdownEvent, String> {
  DropdownBloc() : super(("Premier League")) {
    on<OnChanged>((event, emit) => emit(event.value));
  }
}
