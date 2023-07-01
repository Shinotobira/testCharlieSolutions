import 'package:dartz/dartz.dart';
import 'package:testcharliesolutions/features/trainee/domain/repository/search_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/use_case.dart';

class DeleteMatchUseCase implements UseCase<Unit, String> {
  const DeleteMatchUseCase(this.searchRepository);
  final SearchRepository searchRepository;

  @override
  Future<Either<Failure, Unit>> call(String id) {
    return searchRepository.deleteMatch(id);
  }
}
