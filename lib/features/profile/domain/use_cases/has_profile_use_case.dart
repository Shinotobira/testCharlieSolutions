import 'package:dartz/dartz.dart';
import 'package:testcharliesolutions/features/profile/domain/repository/profile_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/use_case.dart';

class HasProfileUseCase implements UseCase<bool, NoParams> {
  const HasProfileUseCase(this.profileRepository);
  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) {
    return profileRepository.hasProfile();
  }
}
