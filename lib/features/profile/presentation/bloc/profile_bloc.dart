import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcharliesolutions/core/use_case/use_case.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/domain/entities/user_entity.dart';
import '../../domain/use_cases/get_profile_use_case.dart';
import '../../domain/use_cases/send_information_profile_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.sendInformationUseCase,
    required this.getProfileUseCase,
  }) : super(GetMyUserInitialState()) {
    on<GetUserEvent>((GetUserEvent event, Emitter<ProfileState> emit) async {
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

    on<SendUserEvent>((SendUserEvent event, Emitter<ProfileState> emit) async {
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
  final SendInformationUseCase sendInformationUseCase;
  final GetProfileUseCase getProfileUseCase;
}
