import 'package:find_pet/features/list_animals/domain/entities/list_animals_page_entity.dart';
import 'package:find_pet/features/list_animals/presentation/widgets/animal_card.dart';
import 'package:flutter/material.dart';

class ListSuccessPage extends StatelessWidget {
  const ListSuccessPage({
    Key? key,
    required this.listAnimalsPage,
  }) : super(key: key);

  final ListAnimalsPageEntity listAnimalsPage;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisExtent: 320,
      ),
      itemCount: listAnimalsPage.results.length,
      itemBuilder: (BuildContext context, int index) {
        final result = listAnimalsPage.results[index];
        return AnimalCard(
          id: result.id.toString(),
          species: result.species,
          age: result.age,
          breed: result.breed ?? 'Não consta',
          color: result.color,
          city: result.city,
          state: result.state,
        );
      },
    );
  }
}
