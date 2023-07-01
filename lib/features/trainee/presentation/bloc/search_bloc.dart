import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcharliesolutions/features/trainee/domain/use_cases/delete_match_use_case.dart';
import 'package:testcharliesolutions/features/trainee/domain/use_cases/get_user_list_research_use_case.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/domain/entities/user_entity.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.deleteMatchUseCase,
    required this.getUserListFromResearchUseCase,
  }) : super(SearchInitialState()) {
    on<GetListUserEvent>(
        (GetListUserEvent event, Emitter<SearchState> emit) async {
      final Either<Failure, List<UserEntity>> inputEither =
          await getUserListFromResearchUseCase(event.value);
      final Object inputEitherValue =
          inputEither.fold((Failure l) => l, (List<UserEntity> r) => r);
      if (inputEitherValue is Failure) {
        emit(SearchFailureState(message: inputEitherValue.message));
      } else {
        emit(SearchSuccessState(
            usersListEntity: inputEitherValue as List<UserEntity>));
      }
    });
    on<DeleteMatchEvent>(
            (DeleteMatchEvent event, Emitter<SearchState> emit) async {
          final Either<Failure, Unit> inputEither =
          await deleteMatchUseCase(event.id);
          final Object inputEitherValue =
          inputEither.fold((Failure l) => l, (Unit r) => r);
          if (inputEitherValue is Failure) {
            emit(DeleteFailureState(message: inputEitherValue.message));
          } else {
            emit(DeleteSuccessState());
          }
        });
  }
  final DeleteMatchUseCase deleteMatchUseCase;
  final GetUserListFromResearchUseCase getUserListFromResearchUseCase;
}
