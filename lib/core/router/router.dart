import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/auth/presentaion/pages/login_page.dart';
import 'package:flutter_assignment/features/auth/presentaion/pages/signup_page.dart';
import 'package:flutter_assignment/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter_assignment/features/settings/presentation/page/settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/main_navigation_bar/cubit/bottom_bar_cubit_cubit.dart';
import '../../features/main_navigation_bar/presentation/page/main_nav_screen.dart';

class AppRoute {
  GoRouter? router;
  static final AppRoute _inst = AppRoute._internal();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _dashboardNavigatorKey = GlobalKey<NavigatorState>();
  static final _settingsSectionNavigatorKey = GlobalKey<NavigatorState>();

  factory AppRoute() {
    _inst.router ??= GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: loginRoute,
      routes: [
        GoRoute(
          name: loginRoute,
          path: loginRoute,
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          },
          builder: (context, GoRouterState state) => const LoginPage(),
        ),
        GoRoute(
          name: signUpRoute,
          path: signUpRoute,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SignupPage(),
            );
          },
          builder: (context, GoRouterState state) => const SignupPage(),
        ),
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) => MultiBlocProvider(
                  providers: [
                    BlocProvider<BottomBarCubitCubit>(
                      create: (context) => BottomBarCubitCubit(),
                    ),
                  ],
                  child: NavScreen(
                    key: state.pageKey,
                    child: navigationShell,
                  ),
                ),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: dashboardRoute,
                    path: dashboardRoute,
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: Dashboard(),
                      );
                    },
                    builder: (context, GoRouterState state) =>
                        const Dashboard(),
                  ),
                ],
                navigatorKey: _dashboardNavigatorKey,
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: settingRoute,
                    path: settingRoute,
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: SettingsPage(),
                      );
                    },
                    builder: (context, GoRouterState state) =>
                        const SettingsPage(),
                  ),
                ],
                navigatorKey: _settingsSectionNavigatorKey,
              )
            ]),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: Scaffold());
      },
    );
    return _inst;
  }
  AppRoute._internal();
}
