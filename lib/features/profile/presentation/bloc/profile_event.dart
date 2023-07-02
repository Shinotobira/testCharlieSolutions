part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => <Object>[];
}

class GetMyUserEvent extends ProfileEvent {
  @override
  List<UserEntity> get props => <UserEntity>[];
}

class SendMyUserEvent extends ProfileEvent {
  const SendMyUserEvent({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<UserEntity> get props => <UserEntity>[userEntity];
}

class HasProfileEvent extends ProfileEvent {
  const HasProfileEvent();
  @override
  List<Object?> get props => <Object>[];
}
