import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String photoUrl;

  const UserEntity({this.id, this.name, this.photoUrl});

  @override
  List<Object> get props => [id, name, photoUrl];

  @override
  bool get stringify => true;
}
