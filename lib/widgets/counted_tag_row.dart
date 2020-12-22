import 'package:flutter/material.dart';

import '../common/constants.dart';
import 'inactive_tag.dart';

class CountedTagRow extends StatefulWidget {
  const CountedTagRow({Key key, this.tags}) : super(key: key);

  final List<Widget> tags;

  @override
  _CountedTagRowState createState() => _CountedTagRowState();
}

class _CountedTagRowState extends State<CountedTagRow> {
  List<Size> tagSizes = [];
  Size counterSize;
  Size limits;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  void afterFirstLayout(BuildContext context) {
    setState(() {
      limits = context.size;
      context.findRenderObject().visitChildren((child) {
        if (child is RenderBox) {
          tagSizes.add(child.size);
        }
      });
      counterSize = tagSizes.last;
      tagSizes.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: counterSize == null
          ? _rawTagRowWithCounter()
          : _fittedRow(limits, widget.tags, tagSizes, counterSize),
    );
  }

  List<Widget> _rawTagRowWithCounter() =>
      widget.tags.toList()..add(const InactiveTag(text: '+$kTagOnCardLimit'));

  List<Widget> _fittedRow(Size sizeLimit, List<Widget> children,
      List<Size> childrenSizes, Size counterSize) {
    assert(
        children.length == childrenSizes.length,
        'children.length = ${children.length} == '
        'childrenSizes.length = ${childrenSizes.length}');

    final result = <Widget>[];
    var runMainAxisExtent = 0.0;
    var overflowedChildcounter = 0;

    for (var i = 0; i < children.length; i++) {
      if (result.isNotEmpty &&
          runMainAxisExtent + childrenSizes[i].width > sizeLimit.width) {
        if (runMainAxisExtent + counterSize.width > sizeLimit.width) {
          // 1 component = child + SizedBox
          result..removeLast()..removeLast();
          overflowedChildcounter = children.length - result.length ~/ 2;
          result
            ..add(const Spacer())
            ..add(InactiveTag(text: '+$overflowedChildcounter'));
          return result;
        } else {
          result
            ..add(const Spacer())
            ..add(InactiveTag(text: '+$overflowedChildcounter'));
          return result;
        }
      }

      if (result.isEmpty && childrenSizes[i].width > sizeLimit.width) {
        overflowedChildcounter = children.length;
        return [
          const Spacer(),
          InactiveTag(text: '+$overflowedChildcounter'),
        ];
      } else {
        result..add(children[i])..add(const SizedBox(width: kTagRowRunSpace));
      }

      if (result.isNotEmpty) {
        runMainAxisExtent += childrenSizes[i].width + kTagRowRunSpace;
      }
    }
    return result;
  }
}
