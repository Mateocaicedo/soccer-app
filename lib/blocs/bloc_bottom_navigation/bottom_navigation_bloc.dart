import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';

//create a bloc for the bottom navigation bar
class BottomNavigationBloc extends Bloc<BottomNavigationEvent, int> {
  BottomNavigationBloc() : super(0) {

    //when receive pagetapped event, change the state to the index of the page
    on<PageTapped>((event, emit) => emit(event.pageIndex)) ;
      
    
  }
}
