import 'package:get_it/get_it.dart';
import 'package:testcharliesolutions/features/home/domain/use_cases/send_user_information_use_case.dart';
import 'package:testcharliesolutions/features/profile/data/data_sources/profile_data_source.dart';
import 'package:testcharliesolutions/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:testcharliesolutions/features/profile/domain/repository/profile_repository.dart';
import 'package:testcharliesolutions/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:testcharliesolutions/features/profile/domain/use_cases/send_information_profile_use_case.dart';
import 'package:testcharliesolutions/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:testcharliesolutions/features/trainee/data/data_sources/search_data_source.dart';
import 'package:testcharliesolutions/features/trainee/data/repositories/search_repository_impl.dart';
import 'package:testcharliesolutions/features/trainee/domain/repository/search_repository.dart';
import 'package:testcharliesolutions/features/trainee/domain/use_cases/delete_match_use_case.dart';
import 'package:testcharliesolutions/features/trainee/domain/use_cases/get_user_list_research_use_case.dart';
import 'package:testcharliesolutions/features/trainee/presentation/bloc/search_bloc.dart';

import '../../features/home/data/data_sources/api_data_source.dart';
import '../../features/home/data/repositories/user_information_repository_impl.dart';
import '../../features/home/domain/repository/user_information_repository.dart';
import '../../features/home/domain/use_cases/get_user_information_use_case.dart';
import '../../features/home/presentation/bloc/user_bloc.dart';

final GetIt getIt = GetIt.I;

Future<void> initInjectionDependencies() async {
  initBloc();
  initUseCase();
  initRepositories();
  initDataSources();
  initExternal();
  initCore();
}

void initBloc() {
  getIt.registerFactory(() => UserBloc(
      getUserInformationUseCase: getIt(), sendUserInformationUseCase: getIt()));
  getIt.registerFactory(() =>
      ProfileBloc(getProfileUseCase: getIt(), sendInformationUseCase: getIt()));
  getIt.registerFactory(() => SearchBloc(
      getUserListFromResearchUseCase: getIt(), deleteMatchUseCase: getIt()));
}

void initUseCase() {
  getIt.registerLazySingleton(() => GetUserInformationUseCase(getIt()));
  getIt.registerLazySingleton(() => SendInformationUseCase(getIt()));
  getIt.registerLazySingleton(() => GetProfileUseCase(getIt()));
  getIt.registerLazySingleton(() => SendUserInformationUseCase(getIt()));
  getIt.registerLazySingleton(() => GetUserListFromResearchUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteMatchUseCase(getIt()));
}

void initRepositories() {
  getIt.registerLazySingleton<UserInformationRepository>(
      () => UserInformationRepositoryImpl(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(getIt()));
  getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(getIt()));
}

void initDataSources() {
  getIt.registerLazySingleton(() => ApiDataSources());
  getIt.registerLazySingleton(() => ProfileDataSources());
  getIt.registerLazySingleton(() => SearchDataSource());
}

void initExternal() {}

void initCore() {}
