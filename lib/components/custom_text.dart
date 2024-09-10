import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final bool? softWrap;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final double? paddingTop;
  final Key? key;

  const CustomText(this.text,
      {this.fontWeight,
      this.fontSize,
      this.maxLines,
      this.softWrap,
      this.textAlign,
      this.color,
      this.overflow,
      this.paddingTop,
      this.paddingLeft,
      this.paddingRight,
      this.paddingBottom,
      this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: paddingTop ?? 0,
          left: paddingLeft ?? 0,
          right: paddingRight ?? 0,
          bottom: paddingBottom ?? 0),
      child: Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        softWrap: softWrap,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          inherit: false,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}
