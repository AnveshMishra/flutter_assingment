import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/common/widgets/padding_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubit/bottom_bar_cubit_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BottomAppBar(
        child: SizedBox(
          height: 48,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<BottomBarCubitCubit, BottomBarCubitState>(
            builder: (context, state) {
              int selectedIndex = state.index;
              var cubit = context.read<BottomBarCubitCubit>();
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconBottomBar(
                      text: "Home",
                      iconWidget: selectedIndex == 0
                          ? const Icon(Icons.home_filled)
                          : const Icon(Icons.home_outlined),
                      selected: selectedIndex == 0,
                      onPressed: () {
                        child.goBranch(0, initialLocation: selectedIndex == 0);
                        cubit.setIndex(0);
                        // child.goBranch(0);
                      }),
                  IconBottomBar(
                      text: "Setting",
                      iconWidget: selectedIndex == 1
                          ? const Icon(Icons.settings_applications)
                          : const Icon(Icons.settings_applications_outlined),
                      selected: selectedIndex == 1,
                      onPressed: () {
                        child.goBranch(1, initialLocation: selectedIndex == 1);
                        cubit.setIndex(1);
                      }),
                ],
              );
            },
          ).paddingBySide(left: 25, right: 25),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {super.key,
      required this.text,
      required this.selected,
      required this.onPressed,
      required this.iconWidget});
  final String text;
  final bool selected;
  final Widget iconWidget;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color.fromARGB(255, 200, 158, 91);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8,
          ),
          iconWidget,
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12, height: .1),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
