import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return NeuShape.card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title),
            Text(description),
            Row(children: _buildTags()),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTags() => List.generate(
        tags.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: InactiveTag(
            text: tags[index].name,
            color: tags[index].color,
          ),
        ),
      );
}
