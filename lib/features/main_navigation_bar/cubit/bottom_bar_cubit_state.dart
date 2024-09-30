part of 'bottom_bar_cubit_cubit.dart';

abstract class BottomBarCubitState extends Equatable {
  const BottomBarCubitState(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}

class BottomBarCubitInitial extends BottomBarCubitState {
  const BottomBarCubitInitial(super.index);
}

class BottomBarIndexChange extends BottomBarCubitState {
  const BottomBarIndexChange(super.index);
}
