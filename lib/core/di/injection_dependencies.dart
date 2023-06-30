import 'package:get_it/get_it.dart';
import 'package:testcharliesolutions/features/profile/data/data_sources/profile_data_source.dart';
import 'package:testcharliesolutions/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:testcharliesolutions/features/profile/domain/repository/profile_repository.dart';
import 'package:testcharliesolutions/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:testcharliesolutions/features/profile/domain/use_cases/send_information_profile_use_case.dart';
import 'package:testcharliesolutions/features/profile/presentation/bloc/profile_bloc.dart';

import '../../features/home/data/data_sources/api_data_sources.dart';
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
  getIt.registerFactory(() => UserBloc(getUserInformationUseCase: getIt()));
  getIt.registerFactory(() =>
      ProfileBloc(getProfileUseCase: getIt(), sendInformationUseCase: getIt()));
}

void initUseCase() {
  getIt.registerLazySingleton(() => GetUserInformationUseCase(getIt()));
  getIt.registerLazySingleton(() => SendInformationUseCase(getIt()));
  getIt.registerLazySingleton(() => GetProfileUseCase(getIt()));
}

void initRepositories() {
  getIt.registerLazySingleton<UserInformationRepository>(
      () => UserInformationRepositoryImpl(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(getIt()));
}

void initDataSources() {
  getIt.registerLazySingleton(() => ApiDataSources());
  getIt.registerLazySingleton(() => ProfileDataSources());
}

void initExternal() {}

void initCore() {}
