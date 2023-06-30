import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcharliesolutions/features/profile/presentation/bloc/profile_bloc.dart';

import '../../features/home/presentation/bloc/user_bloc.dart';
import '../di/injection_dependencies.dart';
import '../router/router.dart';

class MainMaterialApp extends StatelessWidget {
  const MainMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<Bloc<dynamic, dynamic>>>[
        BlocProvider<UserBloc>(
          create: (BuildContext context) =>
              getIt<UserBloc>()..add(GetMyUserEvent()),
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => getIt<ProfileBloc>(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'CharlieSolutionsAlternance',
        routerConfig: router,
      ),
    );
  }
}
