import 'package:flutter/material.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    Key? key,
    required this.id,
    this.name,
    required this.species,
    required this.age,
    required this.breed,
    required this.color,
    required this.city,
    required this.state,
  }) : super(key: key);

  final String id;
  final String? name;
  final String species;
  final String age;
  final String breed;
  final String color;
  final String city;
  final String state;

  String createNameOrIdentification() {
    if (name != null) {
      return name as String;
    } else {
      return '$breed - $color';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/animal-detail/$id');
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 50,
        height: 200,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/golden-retriever-royalty-free-image-506756303-1560962726.jpg?crop=0.672xw:1.00xh;0.166xw,0&resize=640:*',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                height: 145,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
                      child: Text(
                        createNameOrIdentification(),
                        textAlign: TextAlign.center,
                      ).headline5(),
                    ),
                    iconAndText(icon: Icons.pets, text: species),
                    iconAndText(icon: Icons.badge, text: breed),
                    iconAndText(icon: Icons.brush, text: color),
                    iconAndText(
                        icon: Icons.location_on, text: '$city - $state'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget iconAndText({
  required IconData icon,
  required String text,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Icon(
          icon,
          size: 18,
        ),
      ),
      Text(
        text,
      ).body3(),
    ],
  );
}
