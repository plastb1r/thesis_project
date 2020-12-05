import 'package:equatable/equatable.dart';
import 'tag_entity.dart';

class NoteEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<TagEntity> tags;

  const NoteEntity({
    this.id,
    this.title = '',
    this.description = '',
    this.tags = const [],
  });

  @override
  List<Object> get props => [id, title, description, tags];

  @override
  bool get stringify => true;
}
