import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/common/widgets/padding_ext.dart';
import 'package:flutter_assignment/core/theme/app_colors.dart';

class DotProgressView extends StatefulWidget {
  final int numberOfDots;
  final double size;
  final String? loaderText;
  final int duration;
  final Color color;
  final double dotSpacing;
  final double jumpingHeight;

  const DotProgressView({
  super.key,
    this.numberOfDots = 3,
    this.size = 10,
    this.color = AppColors.appPurpleShade,
    this.dotSpacing = 2,
    this.duration = 400,
    this.loaderText,
    this.jumpingHeight = 4,
  });

  @override
  State<DotProgressView> createState() => _DotProgressViewState();
}

class _DotProgressViewState extends State<DotProgressView>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;

  final List<Animation<double>> _animations = [];
  final double _beginTween = 0;
  double _endTween = 4;

  @override
  void initState() {
    _endTween = widget.jumpingHeight;
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    ///initialization of _animationControllers
    ///each _animationController will have same animation duration
    _animationControllers = List.generate(
      widget.numberOfDots,
      (index) {
        return AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.duration),
        );
      },
    ).toList();

    ///initialization of _animations
    ///here end value is -20
    ///end value is amount of jump.s
    ///and we want our dot to jump in upward direction
    for (int i = 0; i < widget.numberOfDots; i++) {
      _animations.add(
        Tween<double>(begin: _beginTween, end: _endTween)
            .chain(CurveTween(curve: Curves.easeInOut))
            .animate(_animationControllers[i]),
      );
    }

    for (int i = 0; i < widget.numberOfDots; i++) {
      _animationControllers[i].addListener(() {
        //start next dot animation once current dot animation reaches 33%
        if (_animationControllers[i].value > .33 &&
            i != widget.numberOfDots - 1) {
          _animationControllers[i + 1].forward();
        }
      });
      _animationControllers[i].addStatusListener((status) {
        //On Complete
        if (status == AnimationStatus.completed) {
          //return of original position
          _animationControllers[i].reverse(from: .9);
          //if it is not last dot then start the animation of next dot.
        }
        //if last dot is back to its original position then start animation of the first dot.
        // now this animation will be repeated infinitely
        if (i == widget.numberOfDots - 1 &&
            status == AnimationStatus.dismissed) {
          _animationControllers[0].forward();
        }
      });
    }

    //trigger animation of first dot to start the whole animation.
    _animationControllers.first.forward();
  }

  @override
  void dispose() {
    for (final controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.loaderText != null)
          Text(
            widget.loaderText.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ).paddingBySide(left: 48, right: 48),
        if (widget.loaderText != null)
          const SizedBox(
            height: 28,
          ),
        Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.numberOfDots, (index) {
            return AnimatedBuilder(
              animation: _animationControllers[index],
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_animations[index].value),
                  child: DotWidget(
                    size: widget.size,
                    color: widget.color,
                  ),
                  // size: (widget.size)),
                ).paddingAllSide(widget.dotSpacing);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

///this class is used to build a single dot for loading animation
class DotWidget extends StatelessWidget {
  final double size;
  final Color color;

  const DotWidget({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      height: size,
      width: size,
    );
  }
}
