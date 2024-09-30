import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/settings_cubit.dart';

const settingRoute = '/settings';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          BlocBuilder<SettingsCubit, bool>(
            builder: (context, state) {
              return SwitchListTile(
                  title: const Text('Enable Dark mode'),
                  value: state,
                  onChanged: (bool value) {
                    context.read<SettingsCubit>().toggleTheme();
                  });
            },
          )
        ],
      ),
    );
  }
}
