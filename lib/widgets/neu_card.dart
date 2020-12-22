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
        padding: kCardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (withTitle) ...[
              Text(
                title,
                maxLines: _numberOfLinesForTitle(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: kCardTitleFontSize),
              ),
              const SizedBox(height: kCardSpaceBetweenText),
            ],
            if (withDescription) ...[
              Text(
                description,
                maxLines: _numberOfLinesForDescription(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: kCardDescriptionFontSize,
                  color: kDescriptionTextColor,
                ),
              ),
              const SizedBox(height: kCardSpaceBetweenText),
            ],
            CountedTagRow(tags: _rawTagRow()),
          ],
        ),
      ),
    );
  }

  int _numberOfLinesForTitle() =>
      withDescription ? kCardTitleLowMaxLines : kCardTitleHighMaxLines;

  int _numberOfLinesForDescription() =>
      withTitle ? kCardDescriptionLowMaxLines : kCardDescriptionHighMaxLines;

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
