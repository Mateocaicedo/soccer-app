part of 'dropdown_bloc.dart';

abstract class DropdownEvent extends Equatable {
  const DropdownEvent();

  @override
  List<Object> get props => [];
}

class OnChanged extends DropdownEvent {
  final String value;

  const OnChanged(this.value);
  @override
  List<Object> get props => [value];

  @override
  String toString() => 'OnChanged { value: $value }';
}

