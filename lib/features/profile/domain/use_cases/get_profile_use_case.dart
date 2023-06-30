import 'package:dartz/dartz.dart';
import 'package:testcharliesolutions/features/profile/domain/repository/profile_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../home/domain/entities/user_entity.dart';

class GetProfileUseCase implements UseCase<UserEntity, NoParams> {
  const GetProfileUseCase(this.profileRepository);
  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams noParams) {
    return profileRepository.getInformationUser();
  }
}
