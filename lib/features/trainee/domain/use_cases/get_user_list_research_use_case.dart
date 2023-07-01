import 'package:dartz/dartz.dart';
import 'package:testcharliesolutions/features/trainee/domain/repository/search_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../home/domain/entities/user_entity.dart';

class GetUserListFromResearchUseCase
    implements UseCase<List<UserEntity>, String> {
  const GetUserListFromResearchUseCase(this.searchRepository);
  final SearchRepository searchRepository;

  @override
  Future<Either<Failure, List<UserEntity>>> call(String value) {
    return searchRepository.getInformationUsers(value);
  }
}
