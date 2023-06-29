import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/user_information_repository.dart';
import '../data_sources/api_data_sources.dart';
import '../models/user_modele.dart';

class UserInformationRepositoryImpl implements UserInformationRepository {
  UserInformationRepositoryImpl(this.apiDataSources);
  final ApiDataSources apiDataSources;

  @override
  Future<Either<Failure, UserEntity>> getInformationUser() async {
    try {
      final UserModel informationUser = await apiDataSources.getData();
      return right(informationUser.toEntity());
    } catch (e) {
      log(e.toString());
      return left(Failure(
          message: 'La récupération a échouer',
          timestamp: DateTime.now().millisecondsSinceEpoch));
    }
  }
}
