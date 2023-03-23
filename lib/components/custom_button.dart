import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final Color? textColor;
  final List<Color>? gradient;
  final BorderSide? borderSide;
  final double? radius;
  final double? textSize;
  final bool isLoading;
  final BorderRadius? borderRadius;
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.textColor,
      this.text,
      this.color,
      this.child,
      this.width = double.infinity,
      this.height,
      this.gradient = const [Colors.transparent, Colors.transparent],
      this.borderSide,
      this.radius = 50,
      this.borderRadius,
      this.isLoading = false,
      this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading ? true : false,
      child: SizedBox(
        height: height ?? 60,
        width: width,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 650),
          decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(radius!),
              gradient: LinearGradient(colors: gradient!)),
          child: MaterialButton(
            elevation: 0,
            onPressed: onPressed,
            color: color,
            shape: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(radius!),
                borderSide: borderSide ?? BorderSide.none),
            child: child ??
                Text(text!,
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: textSize ?? 17,
                        fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
