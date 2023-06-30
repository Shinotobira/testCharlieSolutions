part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => <Object>[];
}

class GetUserInitialState extends UserState {}

class GetUserSuccessState extends UserState {
  const GetUserSuccessState({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<UserEntity> get props => <UserEntity>[userEntity];
}

class GetUserFailureState extends UserState {
  GetUserFailureState({required this.message});

  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String message;

  @override
  List<String> get props => <String>[timestamp, message];
}

class SendUserSuccessState extends UserState {}

class SendUserFailureState extends UserState {
  SendUserFailureState({required this.message});

  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String message;

  @override
  List<String> get props => <String>[timestamp, message];
}
