import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'constants.dart';

class NeuDecoration extends Decoration {
  const NeuDecoration({
    @required this.elevation,
    ShapeBorder shapeBorder = kButtonStadiumBorder,
    this.boxShadows = kButtonShadowBoxes,
    this.borderColors = kBorderGradientColors,
    this.innerShadowColors = kInnerShadowColors,
    Color innerColor = kInnerColor,
  })  : assert(elevation != null, 'Elevation must not be null.'),
        assert(
            !(elevation >= 0 && (boxShadows == null || borderColors == null)),
            'BorderColors and boxShadows must not be null '
            'when element is rendered above the surface.'),
        assert(
            !(elevation < 0 &&
                (innerShadowColors == null || borderColors == null)),
            '[BorderColor and innerShadowColors must not be null '
            'when element is rendered below the surface.'),
        shapeBorder = shapeBorder ?? kButtonStadiumBorder,
        innerColor = innerColor ?? kInnerColor;

  final double elevation;
  final ShapeBorder shapeBorder;
  final List<BoxShadow> boxShadows;
  final List<Color> borderColors;
  final List<Color> innerShadowColors;
  final Color innerColor;

  @override
  EdgeInsetsGeometry get padding => shapeBorder.dimensions;

  // TODO: implement and test isComplex
  // @override
  // bool get isComplex => true;

  @override
  BoxPainter createBoxPainter([Function onChanged]) => _NeuDecorationPainter(
      elevation,
      shapeBorder,
      boxShadows,
      innerShadowColors,
      borderColors,
      innerColor);

  @override
  Decoration lerpFrom(Decoration a, double t) {
    assert(t != null, "parameter 't' can't be null");
    if (a is NeuDecoration) {
      final curveValue = Curves.easeInOut.transform(t);
      final aInnerShadowColors = a.innerShadowColors ?? [null, null];
      final bInnerShadowColors = innerShadowColors ?? [null, null];
      final aBorderColors = a.borderColors ?? [null, null];
      final bBorderColors = borderColors ?? [null, null];

      return NeuDecoration(
        elevation: ui.lerpDouble(a.elevation, elevation, curveValue),
        shapeBorder: ShapeBorder.lerp(a.shapeBorder, shapeBorder, curveValue),
        boxShadows: BoxShadow.lerpList(
          a.boxShadows ?? kTransparentShadowBoxes,
          boxShadows ?? kTransparentShadowBoxes,
          t,
        ),
        innerShadowColors: [
          Color.lerp(aInnerShadowColors[0], bInnerShadowColors[0], t),
          Color.lerp(aInnerShadowColors[1], bInnerShadowColors[1], t),
        ],
        borderColors: [
          Color.lerp(aBorderColors[0], bBorderColors[0], t),
          Color.lerp(aBorderColors[1], bBorderColors[1], t),
        ],
      );
    }
    return null;
  }
}

class _NeuDecorationPainter extends BoxPainter {
  _NeuDecorationPainter(
    this.elevation,
    this.shapeBorder,
    this.boxShadows,
    this.innerShadowColors,
    this.borderColors,
    this.innerColor,
  ) {
    if (isBellowSurface) {
      borderColors = [borderColors[1], borderColors[0]];
    }
  }

  double elevation;
  ShapeBorder shapeBorder;
  List<BoxShadow> boxShadows;
  List<Color> innerShadowColors;
  List<Color> borderColors;
  Color innerColor;

  bool get isBellowSurface => elevation < 0;

  @override
  void paint(
      ui.Canvas canvas, ui.Offset offset, ImageConfiguration configuration) {
    final outherBorderPath =
        shapeBorder.getOuterPath(offset & configuration.size);
    final rect = outherBorderPath.getBounds();

    final stops = _getStops(rect);
    final offsets = _getGradientOffsets(rect.size);

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = kBorderWidth
      ..shader =
          ui.Gradient.linear(offsets[0], offsets[1], borderColors, stops);

    if (isBellowSurface) {
      final innerShadowPaint = Paint()
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, -elevation)
        ..shader = ui.Gradient.linear(
            offsets[0], offsets[1], innerShadowColors, stops);

      final innerShadowPath = Path()
        ..fillType = PathFillType.evenOdd
        ..addRect(rect.inflate(-elevation * 2))
        ..addPath(outherBorderPath, Offset.zero);

      canvas
        ..clipPath(outherBorderPath)
        ..drawPath(innerShadowPath, innerShadowPaint)
        ..drawPath(outherBorderPath, borderPaint);
    } else {
      final innerBlankPaint = Paint()..color = innerColor;

      _paintShadows(canvas, rect);

      canvas
        ..drawPath(outherBorderPath, innerBlankPaint)
        ..drawPath(outherBorderPath, borderPaint);
    }
  }

  List<double> _getStops(Rect rect) {
    if (rect.size.aspectRatio < 4 && rect.size.aspectRatio > 1 / 4) {
      final delta = 32 / rect.longestSide;
      final stops = [0.5 - delta, 0.5 + delta];
      return stops;
    } else {
      return null;
    }
  }

  List<Offset> _getGradientOffsets(Size boxSize) {
    final diagonal =
        sqrt(boxSize.height * boxSize.height + boxSize.width * boxSize.width);

    if (boxSize.aspectRatio > 1) {
      final cosine = boxSize.width / diagonal;
      final delta = diagonal / (2 * cosine);
      return [Offset(boxSize.width - delta, 0), Offset(delta, boxSize.height)];
    } else {
      final cosine = boxSize.height / diagonal;
      final delta = diagonal / (2 * cosine);
      return [Offset(0, boxSize.height - delta), Offset(boxSize.width, delta)];
    }
  }

  void _paintShadows(Canvas canvas, Rect rect) {
    for (final boxShadow in boxShadows) {
      final paint = boxShadow.toPaint();
      final bounds =
          rect.shift(boxShadow.offset).inflate(boxShadow.spreadRadius);
      _paintBox(canvas, bounds, paint);
    }
  }

  void _paintBox(Canvas canvas, Rect rect, Paint paint) {
    if (shapeBorder is CircleBorder) {
      final center = rect.center;
      final radius = rect.shortestSide / 2.0;
      canvas.drawCircle(center, radius, paint);
    }
    if (shapeBorder is RoundedRectangleBorder) {
      final shape = shapeBorder as RoundedRectangleBorder;
      if (shape.borderRadius == null) {
        canvas.drawRect(rect, paint);
      } else {
        canvas.drawRRect(
            shape.borderRadius.resolve(TextDirection.ltr).toRRect(rect), paint);
      }
    }
    if (shapeBorder is StadiumBorder) {
      final radius = Radius.circular(rect.shortestSide / 2.0);
      canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
    }
  }
}
