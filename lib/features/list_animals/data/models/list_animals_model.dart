import 'package:find_pet/features/list_animals/domain/entities/list_animals_entity.dart';

class ListAnimalsModel extends ListAnimalsEntity {
  const ListAnimalsModel({
    required super.id,
    required super.url,
    super.name,
    super.sex,
    required super.species,
    super.breed,
    required super.color,
    super.age,
  });

  factory ListAnimalsModel.fromJson(Map<String, dynamic> json) {
    return ListAnimalsModel(
      id: json['_id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      sex: json['sex'] as String,
      species: json['species'] as String,
      breed: json['breed'] as String,
      color: json['color'] as String,
      age: json['age'] as String,
    );
  }
}
