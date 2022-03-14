import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final List<Color>? gradient;
  final BorderSide? borderSide;
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.textStyle,
      this.text,
      this.color,
      this.child,
      this.width = double.infinity,
      this.height,
      this.gradient = const [Colors.transparent, Colors.transparent],
      this.borderSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(colors: gradient!)),
        child: MaterialButton(
          onPressed: onPressed,
          child: child ??
              Text(text!,
                  style: textStyle ??
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
          color: color,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: borderSide ?? BorderSide.none),
        ),
      ),
    );
  }
}
