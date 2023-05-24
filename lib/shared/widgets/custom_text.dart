import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.height,
    this.textAlign=TextAlign.left,
    this.decoration,
    this.maxLine,
    this.fontFamily,
    this.overFlow,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final TextAlign textAlign;
  final TextDecoration? decoration;
  final int? maxLine;
  final TextOverflow? overFlow;
  final String? fontFamily;


  @override
  Widget build(BuildContext context) {
    return
      Text(
        text,
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overFlow,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          height: height,
          decoration: decoration,
          fontFamily: fontFamily,
        ),
      );
  }
}
