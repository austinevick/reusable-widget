import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final Color? textColor;
  final LinearGradient? gradient;
  final BorderSide? borderSide;
  final double? radius;
  final double? textSize;
  final FontWeight? fontWeight;
  final bool isLoading;

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
      this.isLoading = false,
      this.textSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading ? true : false, //Disable button on loading state
        child: AnimatedContainer(
          height: height,
        width: width,
          duration: const Duration(milliseconds: 650),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius!),
              gradient: gradient,
          child: MaterialButton(
            elevation: 0,
            onPressed: onPressed,
            color: color,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: borderSide ?? BorderSide.none),
            child: child ??
                Text(text!,
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: textSize ?? 16,
                        fontWeight: fontWeight ?? FontWeight.w600)),
          ),
        ),
    );
  }
}

class ButtonLoader extends StatelessWidget {
  final bool isLoading;
  final String? text;
  final Color? color;
  final Color? spinnerColor;
  const ButtonLoader(
      {Key? key,
      required this.isLoading,
      required this.text,
      this.color,
      this.spinnerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Text(
            text!,
            style: TextStyle(
              color: color,
            ),
          )
        : Center(
            child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                    color: spinnerColor ?? Colors.white, strokeWidth: 2)),
          );
  }
}







