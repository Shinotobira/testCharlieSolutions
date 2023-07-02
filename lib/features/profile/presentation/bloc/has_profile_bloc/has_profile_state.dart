part of 'has_profile_bloc.dart';

abstract class HasProfileState extends Equatable {
  const HasProfileState();

  @override
  List<Object> get props => <Object>[];
}

class HasProfileInitialState extends HasProfileState {}

class HasProfileSuccessState extends HasProfileState {}

class HasNotProfileState extends HasProfileState {
  HasNotProfileState({required this.message});

  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String message;

  @override
  List<String> get props => <String>[timestamp, message];
}
