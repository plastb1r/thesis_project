import 'package:flutter/widgets.dart';

import 'entities/note_entity.dart';
import 'entities/tag_entity.dart';

List<NoteEntity> fakeNotes = List.generate(
    30,
    (index) => NoteEntity(
            id: 'id $index',
            title: 'title$index',
            description: 'description$index',
            tags: [
              TagEntity(
                  name: 'tag$index', color: Color(0xFF20E0E0 + 0x60 * index)),
              TagEntity(
                  name: 'tag$index', color: Color(0xFF40E0E0 + 0x60 * index)),
              TagEntity(
                  name: 'tag$index', color: Color(0xFF80E0E0 + 0x60 * index)),
            ]));

List<TagEntity> fakeTags = List.generate(
    6,
    (index) =>
        TagEntity(name: 'Health', color: Color(0xFF6AE0B6 + 0xA0 * index)))
  ..add(const TagEntity(name: 'Health'))
  ..add(const TagEntity(name: 'Health'))
  ..add(const TagEntity(name: 'Health'));
