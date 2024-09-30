import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<bool> {
  SettingsCubit() : super(true);

  bool isDark = true;

  void toggleTheme() {
    isDark = !isDark;

    emit(isDark);
  }
}
