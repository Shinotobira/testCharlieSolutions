import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/domain/entities/user_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<UserEntity>>> getInformationUsers(String value);
}
