import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:testcharliesolutions/features/trainee/data/data_sources/search_data_source.dart';
import 'package:testcharliesolutions/features/trainee/domain/repository/search_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/data/models/user_modele.dart';
import '../../../home/domain/entities/user_entity.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this.searchDataSource);
  final SearchDataSource searchDataSource;

  @override
  Future<Either<Failure, List<UserEntity>>> getInformationUsers(
      String value) async {
    try {
      final List<UserModel> listUsersModels =
          await searchDataSource.getUsersData(value);
      final List<UserEntity> listUsersEntity = [];

      listUsersModels.forEach((element) {
        listUsersEntity.add(element.toEntity());
      });

      return right(listUsersEntity);
    } catch (e) {
      log(e.toString());
      return left(Failure(
          message: 'La récupération a échouer',
          timestamp: DateTime.now().millisecondsSinceEpoch));
    }
  }
  @override
  Future<Either<Failure, Unit>> deleteMatch(
      String id) async {
    try {

      await searchDataSource.deleteMath(id);
      return right(unit);
    } catch (e) {
      log(e.toString());
      return left(Failure(
          message: 'La récupération a échouer',
          timestamp: DateTime.now().millisecondsSinceEpoch));
    }
  }
}
