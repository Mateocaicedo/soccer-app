part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];

}

//this class is used to change the index of the bottom navigation bar
class PageTapped extends BottomNavigationEvent {
  final int pageIndex;

  const PageTapped(this.pageIndex);
  @override
  List<Object> get props => [pageIndex];

  @override
  String toString() => 'PageTapped { pageIndex: $pageIndex }';
}
