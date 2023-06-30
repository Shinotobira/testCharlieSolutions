part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object?> get props => <Object>[];
}

class GetUserEvent extends UserEvent {
  @override
  List<UserEntity> get props => <UserEntity>[];
}

class SendUserEvent extends UserEvent {
  @override
  List<UserEntity> get props => <UserEntity>[];
}
