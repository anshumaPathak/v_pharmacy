import 'package:flutter/material.dart';

const double kDefaultFontSize = 14.0;

class TextConst extends StatelessWidget {
  final String title;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;

  const TextConst(
      this.title, {
        super.key,
        this.size,
        this.fontWeight,
        this.color,
        this.fontFamily,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
        fontSize: size ?? kDefaultFontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        // fontFamily: fontFamily ?? AppFonts.poppinsReg,
      ),
    );
  }
}
