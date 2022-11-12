import 'package:find_pet/features/animal_detail/domain/entities/animal_detail_entity.dart';
import 'package:find_pet/features/list_animals/domain/entities/list_animals_result_entity.dart';

class AnimalDetailModel extends AnimalDetailEntity {
  const AnimalDetailModel({
    required super.id,
    super.name,
    required super.age,
    required super.species,
    super.breed,
    required super.color,
    required super.contact,
    required super.city,
    required super.state,
    required super.address,
    required super.postType,
    super.images,
    required super.isResolved,
    required super.author,
  });

  factory AnimalDetailModel.fromJson(Map<String, dynamic> json) =>
      AnimalDetailModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        species: json["species"],
        breed: json["breed"],
        color: json["color"],
        contact: json["contact"],
        city: json["city"],
        state: json["state"],
        address: json["address"],
        postType: json["post_type"],
        images: json["images"] != null
            ? List<dynamic>.from(json["images"].map((x) => x))
            : null,
        isResolved: json["is_resolved"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "species": species,
        "breed": breed,
        "color": color,
        "contact": contact,
        "city": city,
        "state": state,
        "address": address,
        "post_type": postType,
        "images":
            images != null ? List<dynamic>.from(images!.map((x) => x)) : null,
        "is_resolved": isResolved,
        "author": author,
      };
}
