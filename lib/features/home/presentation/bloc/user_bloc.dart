import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcharliesolutions/core/use_case/use_case.dart';
import 'package:testcharliesolutions/features/home/domain/use_cases/send_user_information_use_case.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/get_user_information_use_case.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required this.sendUserInformationUseCase,
    required this.getUserInformationUseCase,
  }) : super(GetUserInitialState()) {
    on<GetUserEvent>((GetUserEvent event, Emitter<UserState> emit) async {
      final Either<Failure, UserEntity> inputEither =
          await getUserInformationUseCase(NoParams());
      final Object inputEitherValue =
          inputEither.fold((Failure l) => l, (UserEntity r) => r);
      if (inputEitherValue is Failure) {
        emit(GetUserFailureState(message: inputEitherValue.message));
      } else {
        emit(GetUserSuccessState(userEntity: inputEitherValue as UserEntity));
      }
    });

    on<SendUserEvent>((SendUserEvent event, Emitter<UserState> emit) async {
      final Either<Failure, Unit> inputEither =
          await sendUserInformationUseCase(NoParams());
      final Object inputEitherValue =
          inputEither.fold((Failure l) => l, (Unit r) => r);
      if (inputEitherValue is Failure) {
        emit(SendUserFailureState(message: inputEitherValue.message));
      } else {
        emit(SendUserSuccessState());
      }
    });
  }

  final SendUserInformationUseCase sendUserInformationUseCase;
  final GetUserInformationUseCase getUserInformationUseCase;
}
