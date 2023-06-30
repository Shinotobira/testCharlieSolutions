import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/user_information_repository.dart';

class SendUserInformationUseCase implements UseCase<Unit, NoParams> {
  const SendUserInformationUseCase(this.userInformationRepository);
  final UserInformationRepository userInformationRepository;

  @override
  Future<Either<Failure, Unit>> call(NoParams noParams) {
    return userInformationRepository.sendInformationUser();
  }
}
