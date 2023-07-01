part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => <Object>[];
}

class SearchInitialState extends SearchState {}

class SearchSuccessState extends SearchState {
  const SearchSuccessState({required this.usersListEntity});

  final List<UserEntity> usersListEntity;

  @override
  List<Object> get props => [usersListEntity];
}

class SearchFailureState extends SearchState {
  SearchFailureState({required this.message});

  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String message;

  @override
  List<String> get props => <String>[timestamp, message];
}

class DeleteSuccessState extends SearchState {
}

class DeleteFailureState extends SearchState {
  DeleteFailureState({required this.message});

  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String message;

  @override
  List<String> get props => <String>[timestamp, message];
}
