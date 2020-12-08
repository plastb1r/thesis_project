import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../widgets/colored_background.dart';
import 'neu_shape.dart';

class InactiveTag extends StatelessWidget {
  const InactiveTag({
    Key key,
    @required this.text,
    Color color = Colors.transparent,
  })  : assert(text != null, 'A non-null String must be provided to a widget.'),
        color = color ?? Colors.transparent,
        super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return NeuShape.inactive(
      child: Padding(
        padding: kInactiveTagPadding,
        child: ColoredBackground(
          padding: kInactiveTagColorAreaPadding,
          color: color,
          text: text,
          fontSize: 12,
        ),
      ),
    );
  }
}
