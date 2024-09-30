import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/di/di.dart';
import 'package:flutter_assignment/core/router/router.dart';
import 'package:flutter_assignment/core/supabase_utils/supabase_utils.dart';
import 'package:flutter_assignment/core/theme/app_theme.dart';
import 'package:flutter_assignment/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:flutter_assignment/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService().initialize();
  initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => SettingsCubit(),
      )
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, bool>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoute().router,
          theme: getTheme(state),
        );
      },
    );
  }
}
