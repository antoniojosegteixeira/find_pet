import 'package:find_pet/features/post_animal/domain/entities/post_animal_entity.dart';

class PostAnimalModel extends PostAnimalEntity {
  const PostAnimalModel({
    required super.id,
  });

  factory PostAnimalModel.fromJson(Map<String, dynamic> json) {
    return PostAnimalModel(
      id: json['id'].toString(),
    );
  }
}
