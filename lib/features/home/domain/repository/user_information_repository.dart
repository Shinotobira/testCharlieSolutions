import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user_entity.dart';

abstract class UserInformationRepository {
  Future<Either<Failure, UserEntity>> getInformationUser();
  Future<Either<Failure, Unit>> sendInformationUser();
}
