import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/constants.dart';

class ColoredBackground extends StatelessWidget {
  const ColoredBackground({
    Key key,
    @required this.padding,
    @required this.color,
    @required this.text,
    @required this.fontSize,
  }) : super(key: key);

  final EdgeInsets padding;
  final Color color;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: color,
      ),
      child: Padding(
        padding: kChipColorAreaPadding,
        child: Text(
          text,
          style: GoogleFonts.lato(
            fontSize: fontSize,
            color: kChipsTextColor,
          ),
        ),
      ),
    );
  }
}
