import 'package:flutter/widgets.dart';

import 'entities/note_entity.dart';
import 'entities/tag_entity.dart';

const List<TagEntity> fakeTags = [
  TagEntity(id: '0', name: '', color: Color(0xFFa2a2d0)),
  TagEntity(id: '1', name: 's', color: Color(0xFFf0f8ff)),
  TagEntity(id: '2', name: 'short', color: Color(0xFFd8c2ff)),
  TagEntity(id: '3', name: 'medium', color: Color(0x00fddde6)),
  TagEntity(id: '4', name: 'loоооооооng', color: Color(0xFFcd4a4c)),
  TagEntity(
      id: '5',
      name: 'long enough not to fit into a card.',
      color: Color(0xFFa0522d)),
  TagEntity(
      id: '6',
      name: 'so long that in perspective it may not fit '
          'on one line on the screen for changing tags',
      color: Color(0xFFff0000)),
];

const List<NoteEntity> fakeNotes = [
  NoteEntity(id: '-1', title: 'Only title', description: '', tags: []),
  NoteEntity(id: '0', title: '', description: 'Only description', tags: []),
  NoteEntity(
    id: '1',
    title: 'Title and tags',
    description: '',
    tags: [
      TagEntity(name: 'title', color: Color(0xFF5cffad)),
      TagEntity(name: 'and', color: Color(0xFF33ff33)),
      TagEntity(name: 'tags', color: Color(0xFF84e084)),
    ],
  ),
  NoteEntity(
    id: '2',
    title: '',
    description: 'Description and tags',
    tags: [
      TagEntity(name: 'description', color: Color(0xFF00fa9a)),
      TagEntity(name: 'and', color: Color(0xFFaddfad)),
      TagEntity(name: 'tags', color: Color(0xFFdad871)),
    ],
  ),
  NoteEntity(
    id: '3',
    title: 'This card tests what happens if there is '
        'only a large heading with no body text. '
        'This card tests what happens if there is '
        'only a large heading with no body text.',
    description: '',
    tags: [
      TagEntity(name: 'check', color: Color(0xFFcca817)),
      TagEntity(name: 'for', color: Color(0xFFfae7b5)),
      TagEntity(name: 'long title', color: Color(0xFFe7c697)),
    ],
  ),
  NoteEntity(
    id: '4',
    title: '',
    description: 'this card checks the situation '
        'when the user wrote all the content in the description block, '
        'but left the title block empty this card checks the situation '
        'when the user wrote all the content in the description block, '
        'but left the title block empty',
    tags: [
      TagEntity(name: 'check', color: Color(0xFFe9967a)),
      TagEntity(name: 'for', color: Color(0xFFfdbcb4)),
      TagEntity(name: 'description', color: Color(0xFFe6e6fa)),
    ],
  ),
  NoteEntity(
    id: 'empty card',
    title: '',
    description: '',
    tags: [],
  ),
  NoteEntity(
    id: '6',
    title: 'Podcast "Design is Simple"',
    description: 'We need to do live timeline work for the client. '
        'You must always communicate with the premium service. '
        'You need to love your craft.',
    tags: [
      TagEntity(name: 'Podcast', color: Color(0xFF007FFF)),
      TagEntity(name: 'Briefly', color: Color(0xFFc7fcec)),
    ],
  ),
  NoteEntity(id: '-11', title: 'Only title', description: '', tags: []),
  NoteEntity(id: '10', title: '', description: 'Only description', tags: []),
  NoteEntity(
    id: '11',
    title: 'Title and tags',
    description: '',
    tags: [
      TagEntity(name: 'title', color: Color(0xFF5cffad)),
      TagEntity(name: 'and', color: Color(0xFF33ff33)),
      TagEntity(name: 'tags', color: Color(0xFF84e084)),
    ],
  ),
  NoteEntity(
    id: '12',
    title: '',
    description: 'Description and tags',
    tags: [
      TagEntity(name: 'description', color: Color(0xFF00fa9a)),
      TagEntity(name: 'and', color: Color(0xFFaddfad)),
      TagEntity(name: 'tags', color: Color(0xFFdad871)),
    ],
  ),
  NoteEntity(
    id: '13',
    title: 'This card tests what happens if there is '
        'only a large heading with no body text. '
        'This card tests what happens if there is '
        'only a large heading with no body text.',
    description: '',
    tags: [
      TagEntity(name: 'check', color: Color(0xFFcca817)),
      TagEntity(name: 'for', color: Color(0xFFfae7b5)),
      TagEntity(name: 'long title', color: Color(0xFFe7c697)),
    ],
  ),
  NoteEntity(
    id: '14',
    title: '',
    description: 'this card checks the situation '
        'when the user wrote all the content in the description block, '
        'but left the title block empty this card checks the situation '
        'when the user wrote all the content in the description block, '
        'but left the title block empty',
    tags: [
      TagEntity(name: 'check', color: Color(0xFFe9967a)),
      TagEntity(name: 'for', color: Color(0xFFfdbcb4)),
      TagEntity(name: 'description', color: Color(0xFFe6e6fa)),
    ],
  ),
  NoteEntity(
    id: 'empty card',
    title: '',
    description: '',
    tags: [],
  ),
  NoteEntity(
    id: '16',
    title: 'Podcast "Design is Simple"',
    description: 'We need to do live timeline work for the client. '
        'You must always communicate with the premium service. '
        'You need to love your craft.',
    tags: [
      TagEntity(name: 'Podcast', color: Color(0xFF007FFF)),
      TagEntity(name: 'Briefly', color: Color(0xFFc7fcec)),
    ],
  ),
];
