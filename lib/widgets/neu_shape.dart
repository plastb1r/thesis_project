import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../common/neu_decoration.dart';

class NeuShape extends StatelessWidget {
  const NeuShape._({
    Key key,
    this.shapeBorder,
    this.elevation,
    this.boxShadows,
    this.borderColors,
    this.innerShadowColors,
    this.innerColor,
    this.child,
  }) : super(key: key);

  const NeuShape.inactive({
    Key key,
    Widget child,
  }) : this._(
          key: key,
          shapeBorder: kButtonStadiumBorder,
          elevation: 2,
          boxShadows: kShadowBoxes,
          borderColors: kBorderGradientColors,
          innerShadowColors: null,
          innerColor: kInnerColor,
          child: child,
        );

  const NeuShape.card({
    Key key,
    Widget child,
  }) : this._(
          key: key,
          shapeBorder: kButtonStadiumBorder,
          elevation: -2,
          boxShadows: null,
          borderColors: kBorderGradientColors,
          innerShadowColors: kInnerShadowColors,
          innerColor: kInnerColor,
          child: child,
        );

  final ShapeBorder shapeBorder;
  final double elevation;

  final List<BoxShadow> boxShadows;
  final List<Color> borderColors;
  final List<Color> innerShadowColors;
  final Color innerColor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: DecoratedBox(
        decoration: NeuDecoration(
          elevation: elevation,
          shapeBorder: shapeBorder,
          boxShadows: boxShadows,
          borderColors: borderColors,
          innerShadowColors: innerShadowColors,
        ),
        child: child,
      ),
    );
  }
}
