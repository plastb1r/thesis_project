import 'package:flutter/material.dart';

import 'neu_decoration.dart';

// COMMON

const double kFullCurvatureBorderRadius = 1000;
const EdgeInsets kZeroEdgeInsets = EdgeInsets.all(0);

// COLOR

const Color kBackgroundColor = Color(0xFFE9EDF0);
const Color kChipsTextColor = Color(0xFF515151);

const List<Color> kBorderGradientColors = [
  Color(0xFFFFFFFF),
  Color(0xFFD4DBE4),
];

const List<Color> kInnerShadowColors = [
  Color(0xFFA6B4C8),
  Color(0xFFFFFFFF),
];

const Color kInnerColor = Color(0xFFEAEDF2);
const List<Color> kInnerGradientColors = [
  Color(0xFFEEF0F5),
  Color(0xFFE6E9EF),
];

// SHAPE-RELATED

const double kBorderWidth = 1;

const List<BoxShadow> kTransparentShadowBoxes = [
  BoxShadow(
    color: Color(0x00FFFFFF),
    blurRadius: 8,
    offset: Offset(-4, -4),
  ),
  BoxShadow(
    color: Color(0x00A6B4C8),
    blurRadius: 6,
    offset: Offset(4, 4),
  )
];

// BUTTON

const double kButtonElevationUp = 8;
const double kButtonElevationDown = -8;
const double kButtonElevationHold = -12;

const EdgeInsets kButtonPadding =
    EdgeInsets.symmetric(horizontal: 12, vertical: 8);

const ShapeBorder kButtonStadiumBorder = StadiumBorder();
const ShapeBorder kButtonCircleBorder = CircleBorder();

const int kButtonDurationMs = 160;

const List<BoxShadow> kButtonShadowBoxes = [
  BoxShadow(
    color: Color(0x96A6B4C8),
    blurRadius: 6,
    offset: Offset(4, 4),
  ),
  BoxShadow(
    color: Color(0xFFFFFFFF),
    blurRadius: 8,
    offset: Offset(-4, -4),
  ),
];

const Decoration kButtonDecorationStadiumUp = NeuDecoration(
  elevation: kButtonElevationUp,
  shapeBorder: StadiumBorder(),
  boxShadows: kButtonShadowBoxes,
  borderColors: kBorderGradientColors,
  innerShadowColors: null,
  innerColor: kInnerColor,
);

const Decoration kButtonDecorationStadiumDown = NeuDecoration(
  elevation: kButtonElevationDown,
  shapeBorder: StadiumBorder(),
  boxShadows: null,
  borderColors: kBorderGradientColors,
  innerShadowColors: kInnerShadowColors,
  innerColor: kInnerColor,
);

const Decoration kButtonDecorationStadiumHold = NeuDecoration(
  elevation: kButtonElevationHold,
  shapeBorder: StadiumBorder(),
  boxShadows: null,
  borderColors: kBorderGradientColors,
  innerShadowColors: kInnerShadowColors,
  innerColor: kInnerColor,
);

const Decoration kButtonDecorationCircleUp = NeuDecoration(
  elevation: kButtonElevationUp,
  shapeBorder: CircleBorder(),
  boxShadows: kButtonShadowBoxes,
  borderColors: kBorderGradientColors,
  innerShadowColors: null,
  innerColor: kInnerColor,
);

const Decoration kButtonDecorationCircleDown = NeuDecoration(
  elevation: kButtonElevationDown,
  shapeBorder: CircleBorder(),
  boxShadows: null,
  borderColors: kBorderGradientColors,
  innerShadowColors: kInnerShadowColors,
  innerColor: kInnerColor,
);

const Decoration kButtonDecorationCircleHold = NeuDecoration(
  elevation: kButtonElevationHold,
  shapeBorder: CircleBorder(),
  boxShadows: null,
  borderColors: kBorderGradientColors,
  innerShadowColors: kInnerShadowColors,
  innerColor: kInnerColor,
);

// CHIP

const EdgeInsets kChipColorAreaPadding =
    EdgeInsets.symmetric(vertical: 4, horizontal: 7);
const EdgeInsets kChipPadding =
    EdgeInsets.symmetric(horizontal: 6, vertical: 6);

// CARD

const kCardShadowBoxes = [
  BoxShadow(
    color: Color(0xFFA6B4C8),
    blurRadius: 4,
    offset: Offset(1, 1),
  ),
  BoxShadow(
    color: Color(0xFFFFFFFF),
    blurRadius: 3,
    offset: Offset(-2, -2),
  ),
];

const ShapeBorder kCardBorder =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13)));

// INACTIVE TAG

const kInactiveTagPadding = EdgeInsets.all(4);

const kInactiveTagColorAreaPadding =
    EdgeInsets.symmetric(horizontal: 4, vertical: 1);
