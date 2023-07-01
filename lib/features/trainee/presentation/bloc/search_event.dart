part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => <Object>[];
}

class GetListUserEvent extends SearchEvent {
  const GetListUserEvent({required this.value});

  final String value;
  @override
  List<UserEntity> get props => <UserEntity>[];
}
