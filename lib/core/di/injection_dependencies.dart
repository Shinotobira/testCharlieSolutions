import 'package:get_it/get_it.dart';

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
}

void initUseCase() {
  getIt.registerLazySingleton(() => GetUserInformationUseCase(getIt()));
}

void initRepositories() {
  getIt.registerLazySingleton<UserInformationRepository>(
      () => UserInformationRepositoryImpl(getIt()));
}

void initDataSources() {
  getIt.registerLazySingleton(() => ApiDataSources());
}

void initExternal() {}

void initCore() {}
