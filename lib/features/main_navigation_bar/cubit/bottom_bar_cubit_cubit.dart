import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_bar_cubit_state.dart';

class BottomBarCubitCubit extends Cubit<BottomBarCubitState> {
  int index = 0;
  BottomBarCubitCubit() : super(const BottomBarCubitInitial(0));

  void setIndex(int index) {
    this.index = index;
    emit(
      BottomBarIndexChange(index),
    );
  }
}
