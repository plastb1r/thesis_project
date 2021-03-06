import 'package:flutter/material.dart';

import '../common/constants.dart';
import 'colored_background.dart';
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
        child: ColoredBackground(
          padding: kChipColorAreaPadding,
          color: color,
          text: text,
          fontSize: 14,
        ),
      ),
    );
  }
}
