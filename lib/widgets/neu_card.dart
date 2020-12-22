import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../entities/tag_entity.dart';
import 'counted_tag_row.dart';
import 'inactive_tag.dart';
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

  bool get withTitle => title != null && title != '';
  bool get withDescription => description != null && description != '';

  @override
  Widget build(BuildContext context) {
    return NeuShape.card(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, right: 6, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (withTitle) ...[
              Text(
                title,
                maxLines: _numberOfLinesForTitle(),
                style: const TextStyle(fontSize: 19),
              ),
              const SizedBox(height: 9),
            ],
            if (withDescription) ...[
              Text(
                description,
                maxLines: _numberOfLinesForDescription(),
                style:
                    const TextStyle(fontSize: 15, color: kDescriptionTextColor),
              ),
              const SizedBox(height: 9),
            ],
            CountedTagRow(tags: _rawTagRow()),
          ],
        ),
      ),
    );
  }

  int _numberOfLinesForTitle() => withDescription ? 3 : 8;

  int _numberOfLinesForDescription() => withTitle ? 6 : 10;

  List<Widget> _rawTagRow() {
    return List<Widget>.generate(
      tags.length,
      (i) => InactiveTag(
        text: tags[i].name,
        color: tags[i].color,
      ),
    ).toList();
  }
}
