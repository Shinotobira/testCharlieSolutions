import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcharliesolutions/core/use_case/use_case.dart';
import 'package:testcharliesolutions/features/profile/domain/use_cases/has_profile_use_case.dart';

import '../../../../../core/failure/failure.dart';

part 'has_profile_event.dart';
part 'has_profile_state.dart';

class HasProfileBloc extends Bloc<HasProfileEvent, HasProfileState> {
  HasProfileBloc({
    required this.hasProfileUseCase,
  }) : super(HasProfileInitialState()) {
    on<HasProfileEvent>(
        (HasProfileEvent event, Emitter<HasProfileState> emit) async {
      final Either<Failure, bool> inputEither =
          await hasProfileUseCase(NoParams());
      final Object inputEitherValue =
          inputEither.fold((Failure l) => l, (bool r) => r);
      if (inputEitherValue is Failure) {
        emit(HasNotProfileState(message: inputEitherValue.message));
      } else {
        if (inputEitherValue == true) {
          emit(HasProfileSuccessState());
        } else {
          emit(HasNotProfileState(message: "Le profile n'existe pas"));
        }
      }
    });
  }
  final HasProfileUseCase hasProfileUseCase;
}
