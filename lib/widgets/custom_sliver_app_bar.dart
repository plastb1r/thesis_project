import 'package:flutter/material.dart';

import '../common/constants.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
    this.leading,
    this.center,
    this.actions,
  }) : super(key: key);

  final Widget leading;
  final Widget center;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: kCircleButtonSize,
            width: kCircleButtonSize,
            child: leading,
          ),
          kAppBarSectionsSpacing,
          Expanded(child: center),
          kAppBarSectionsSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var action in actions)
                Padding(
                  padding: kAppBarActionsSpasing,
                  child: SizedBox(
                    height: kCircleButtonSize,
                    width: kCircleButtonSize,
                    child: action,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
