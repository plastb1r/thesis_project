import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TagEntity extends Equatable {
  final String id;
  final String name;
  final Color color;

  const TagEntity({
    this.id,
    @required this.name,
    this.color = Colors.transparent,
  });

  @override
  List<Object> get props => [id, name, color];

  @override
  bool get stringify => true;
}
