import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/user_entity.dart';
import '../repository/user_information_repository.dart';

class GetUserInformationUseCase implements UseCase<UserEntity, NoParams> {
  const GetUserInformationUseCase(this.userInformationRepository);
  final UserInformationRepository userInformationRepository;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams noParams) {
    return userInformationRepository.getInformationUser();
  }
}
