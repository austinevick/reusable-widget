import 'package:flutter/material.dart';

class CustomAnimatedImageLoader extends StatefulWidget {
  final String image;
  const CustomAnimatedImageLoader({Key? key, required this.image})
      : super(key: key);

  @override
  State<CustomAnimatedImageLoader> createState() =>
      _CustomAnimatedImageLoaderState();
}

class _CustomAnimatedImageLoaderState extends State<CustomAnimatedImageLoader>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    controller = AnimationController(
        reverseDuration: const Duration(milliseconds: 2000),
        vsync: this,
        duration: const Duration(milliseconds: 1200));
    animation = Tween(begin: 20.0, end: 100.0).animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      if (controller!.isCompleted) controller!.repeat();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80),
      child: Dialog(
        backgroundColor: Colors.black.withOpacity(0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(widget.image, height: animation!.value),
        ),
      ),
    );
  }
}
