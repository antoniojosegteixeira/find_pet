import 'package:find_pet/features/list_animals/presentation/widgets/animal_card.dart';
import 'package:flutter/material.dart';

class ListSuccessPage extends StatelessWidget {
  ListSuccessPage({Key? key}) : super(key: key);

  final list = ["DOG", "CAT", "PARROT", "DOG", "CAT", "PARROT"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisExtent: 320,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return const AnimalCard(
          species: 'Dog',
          age: 'Adult',
          breed: 'Golden Retriever',
          color: 'Golden',
          city: 'Cuiabá',
          state: 'MT',
        );
      },
    );
  }
}
