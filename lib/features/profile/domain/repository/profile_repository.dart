import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserEntity>> getInformationUser();
  Future<Either<Failure, Unit>> sendInformationUser(UserEntity user);
}
