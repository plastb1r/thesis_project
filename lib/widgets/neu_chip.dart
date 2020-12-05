import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/constants.dart';
import 'neu_button.dart';

class NeuChip extends StatelessWidget {
  const NeuChip({
    Key key,
    Color color = Colors.transparent,
    @required this.text,
    @required this.onPressed,
  })  : assert(text != null, 'A non-null String must be provided to a widget.'),
        color = color ?? Colors.transparent,
        super(key: key);

  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return NeuButton.stadium(
      key: key,
      padding: kZeroEdgeInsets,
      onPressed: onPressed,
      child: Padding(
        padding: kChipPadding,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: color,
          ),
          child: Padding(
            padding: kChipColorAreaPadding,
            child: Text(
              text,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: kChipsTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
