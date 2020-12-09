import 'package:flutter/material.dart';

import '../common/constants.dart';

class NeuButton extends StatefulWidget {
  const NeuButton._({
    Key key,
    EdgeInsets padding,
    @required this.decorationUp,
    @required this.decorationDown,
    @required this.decorationHold,
    @required this.onPressed,
    this.child,
  })  : padding = padding ?? kButtonPadding,
        super(key: key);

  const NeuButton.stadium({
    Key key,
    EdgeInsets padding,
    @required VoidCallback onPressed,
    Widget child,
  }) : this._(
          key: key,
          decorationUp: kButtonDecorationStadiumUp,
          decorationDown: kButtonDecorationStadiumDown,
          decorationHold: kButtonDecorationStadiumHold,
          padding: padding,
          onPressed: onPressed,
          child: child,
        );

  const NeuButton.circle({
    Key key,
    EdgeInsets padding,
    @required VoidCallback onPressed,
    Widget child,
  }) : this._(
          key: key,
          decorationUp: kButtonDecorationCircleUp,
          decorationDown: kButtonDecorationCircleDown,
          decorationHold: kButtonDecorationCircleHold,
          padding: padding,
          onPressed: onPressed,
          child: child,
        );

  final Decoration decorationUp;
  final Decoration decorationDown;
  final Decoration decorationHold;

  final EdgeInsets padding;
  final VoidCallback onPressed;
  final Widget child;

  @override
  _NeuButtonState createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  Decoration nextDecoration;
  bool isSelected;

  @override
  void initState() {
    super.initState();

    nextDecoration = widget.decorationUp;
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: TweenAnimationBuilder<Decoration>(
        tween: DecorationTween(
          begin: widget.decorationUp,
          end: nextDecoration,
        ),
        duration: kButtonDurationMs,
        curve: Curves.easeInOut,
        builder: (context, decoration, child) {
          return DecoratedBox(
            decoration: decoration,
            child: child,
          );
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: onTapDownCallback,
          onTapUp: onTapUpCallback,
          onTapCancel: onTapCancelCallback,
          child: Padding(
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void onTapDownCallback(TapDownDetails _) => setState(
        () {
          nextDecoration = widget.decorationHold;
        },
      );

  void onTapUpCallback(TapUpDetails _) => setState(
        () {
          isSelected
              ? nextDecoration = widget.decorationUp
              : nextDecoration = widget.decorationDown;
          isSelected = !isSelected;

          widget.onPressed();
        },
      );

  void onTapCancelCallback() => setState(
        () {
          isSelected
              ? nextDecoration = widget.decorationDown
              : nextDecoration = widget.decorationUp;
        },
      );
}
