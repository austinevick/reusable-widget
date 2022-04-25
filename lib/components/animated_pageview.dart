import 'package:flutter/cupertino.dart';

typedef ChildBuilder = Widget Function(int index, BuildContext context);
typedef OnPageChangeCallback = void Function(int index);

class AnimatedPageView extends StatelessWidget {
  final PageController? controller;
  final double? pageValue;
  final ChildBuilder? child;
  final int? itemCount;
  final OnPageChangeCallback? onPageChanged;
  const AnimatedPageView(
      {Key? key,
      this.controller,
      this.pageValue,
      this.child,
      this.itemCount,
      this.onPageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      controller: controller,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index == pageValue!.floor() + 1 ||
            index == pageValue!.floor() + 2) {
          //Right
          return Transform.translate(
              offset: Offset(0.0, 100 * (index - pageValue!)),
              child: child!(index, context));
        } else if (index == pageValue!.floor() ||
            index == pageValue!.floor() - 1) {
          //Left
          return Transform.translate(
              offset: Offset(0.0, 100 * (pageValue! - index)),
              child: child!(index, context));
        } else {
          //Middle
          return child!(index, context);
        }
      },
    );
  }
}
