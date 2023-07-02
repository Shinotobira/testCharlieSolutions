import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcharliesolutions/core/use_case/use_case.dart';
import 'package:testcharliesolutions/features/profile/domain/use_cases/has_profile_use_case.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/domain/entities/user_entity.dart';
import '../../domain/use_cases/get_profile_use_case.dart';
import '../../domain/use_cases/send_information_profile_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.hasProfileUseCase,
    required this.sendInformationUseCase,
    required this.getProfileUseCase,
  }) : super(GetMyUserInitialState()) {
    on<GetMyUserEvent>(
        (GetMyUserEvent event, Emitter<ProfileState> emit) async {
      final Either<Failure, UserEntity> inputEither =
          await getProfileUseCase(NoParams());
      final Object inputEitherValue =
          inputEither.fold((Failure l) => l, (UserEntity r) => r);
      if (inputEitherValue is Failure) {
        emit(GetMyUserFailureState(message: inputEitherValue.message));
      } else {
        emit(GetMyUserSuccessState(userEntity: inputEitherValue as UserEntity));
      }
    });

    on<HasProfileEvent>(
        (HasProfileEvent event, Emitter<ProfileState> emit) async {
      final Either<Failure, bool> inputEither =
          await hasProfileUseCase(NoParams());
      final Object inputEitherValue =
          inputEither.fold((Failure l) => l, (bool r) => r);
      if (inputEitherValue is Failure) {
        emit(HasNotProfileState(message: inputEitherValue.message));
      } else {
        if (inputEitherValue == true) {
          emit(HasProfileState());
        } else {
          emit(HasNotProfileState(message: "Le profile n'existe pas"));
        }
      }
    });

    on<SendMyUserEvent>(
        (SendMyUserEvent event, Emitter<ProfileState> emit) async {
      final Either<Failure, Unit> inputEither =
          await sendInformationUseCase(event.userEntity);
      final Object inputEitherValue =
          inputEither.fold((Failure l) => l, (Unit r) => r);
      if (inputEitherValue is Failure) {
        emit(SendMyUserFailureState(message: inputEitherValue.message));
      } else {
        emit(SendMyUserSuccessState());
      }
    });
  }
  final HasProfileUseCase hasProfileUseCase;
  final SendInformationUseCase sendInformationUseCase;
  final GetProfileUseCase getProfileUseCase;
}
