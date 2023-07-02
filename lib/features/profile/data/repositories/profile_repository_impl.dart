import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:testcharliesolutions/features/profile/data/data_sources/profile_data_source.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/data/models/user_modele.dart';
import '../../../home/domain/entities/user_entity.dart';
import '../../domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.profileDataSources);
  final ProfileDataSources profileDataSources;

  @override
  Future<Either<Failure, UserEntity>> getInformationUser() async {
    try {
      final UserModel informationUser = await profileDataSources.getUserData();
      return right(informationUser.toEntity());
    } catch (e) {
      log(e.toString());
      return left(Failure(
          message: 'La récupération a échouer',
          timestamp: DateTime.now().millisecondsSinceEpoch));
    }
  }

  @override
  Future<Either<Failure, bool>> hasProfile() async {
    try {
      final bool hasProfile = await profileDataSources.hasProfile();
      return right(hasProfile);
    } catch (e) {
      log(e.toString());
      return left(Failure(
          message: 'La récupération a échouer',
          timestamp: DateTime.now().millisecondsSinceEpoch));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendInformationUser(UserEntity user) async {
    try {
      await profileDataSources.insertUserData(user.toModel());
      return right(unit);
    } catch (e) {
      log(e.toString());
      return left(Failure(
          message: 'La récupération a échouer',
          timestamp: DateTime.now().millisecondsSinceEpoch));
    }
  }
}
