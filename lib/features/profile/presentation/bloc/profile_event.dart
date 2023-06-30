part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => <Object>[];
}

class GetUserEvent extends ProfileEvent {
  @override
  List<UserEntity> get props => <UserEntity>[];
}

class SendUserEvent extends ProfileEvent {
  const SendUserEvent({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<UserEntity> get props => <UserEntity>[userEntity];
}
