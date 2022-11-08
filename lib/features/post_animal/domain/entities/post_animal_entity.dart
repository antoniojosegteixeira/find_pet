import 'package:equatable/equatable.dart';

class PostAnimalEntity extends Equatable {
  const PostAnimalEntity({
    required this.id,
    required this.url,
  });

  final String id;
  final String url;

  @override
  List<Object?> get props => [];
}
