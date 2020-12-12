import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../entities/tag_entity.dart';
import '../widgets/inactive_tag.dart';
import 'neu_shape.dart';

class NeuCard extends StatelessWidget {
  const NeuCard({
    Key key,
    this.title,
    this.description,
    this.tags,
  }) : super(key: key);

  final String title;
  final String description;
  final List<TagEntity> tags;

  List<Widget> get _rawTagRow => List.generate(tags.length, (i) {
        final current = InactiveTag(text: tags[i].name, color: tags[i].color);
        if (i != tags.length - 1) {
          return current;
        } else {
          return Padding(padding: kInactiveTagBetweenPadding, child: current);
        }
      });

  @override
  Widget build(BuildContext context) {
    return NeuShape.card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
            ),
            Text(description),
            _getTagRow(),
          ],
        ),
      ),
    );
  }

  Widget _getTagRow() => Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Wrap(
            children: _rawTagRow,
          ),
          const InactiveTag(text: '+2'),
        ],
      );
}
