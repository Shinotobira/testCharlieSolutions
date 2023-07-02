part of 'has_profile_bloc.dart';

abstract class HasProfileEvent extends Equatable {
  const HasProfileEvent();
  @override
  List<Object?> get props => <Object>[];
}

class HasProfileTestEvent extends HasProfileEvent {
  const HasProfileTestEvent();
  @override
  List<Object?> get props => <Object>[];
}
