import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testcharliesolutions/features/profile/presentation/pages/modification_page.dart';
import 'package:testcharliesolutions/features/profile/presentation/pages/profile_page.dart';
import 'package:testcharliesolutions/features/trainee/presentation/pages/search_profil_page.dart';
import 'package:testcharliesolutions/features/trainee/presentation/pages/trainee_page.dart';

import '../../features/home/domain/entities/user_entity.dart';
import '../../features/home/presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: '/modification_profile',
      name: 'modification_profile',
      builder: (BuildContext context, GoRouterState state) {
        return ModificationProfilePage(user: state.extra! as UserEntity);
      },
    ),
    GoRoute(
      path: '/trainee',
      name: 'trainee',
      builder: (BuildContext context, GoRouterState state) {
        return TraineePage(
          user: state.extra! as UserEntity,
        );
      },
    ),
    GoRoute(
      path: '/search_profile',
      name: 'search_profile',
      builder: (BuildContext context, GoRouterState state) {
        return SearchProfilPage();
      },
    ),
  ],
);
