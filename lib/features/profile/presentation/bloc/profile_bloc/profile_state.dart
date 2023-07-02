part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => <Object>[];
}

class GetMyUserInitialState extends ProfileState {}

class GetMyUserSuccessState extends ProfileState {
  const GetMyUserSuccessState({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<UserEntity> get props => <UserEntity>[userEntity];
}

class GetMyUserFailureState extends ProfileState {
  GetMyUserFailureState({required this.message});

  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String message;

  @override
  List<String> get props => <String>[timestamp, message];
}

class SendMyUserSuccessState extends ProfileState {}

class SendMyUserFailureState extends ProfileState {
  SendMyUserFailureState({required this.message});

  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String message;

  @override
  List<String> get props => <String>[timestamp, message];
}
