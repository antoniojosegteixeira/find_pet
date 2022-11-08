import 'package:flutter/material.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';

class AnimalDetailsPage extends StatelessWidget {
  const AnimalDetailsPage({
    Key? key,
    required this.postId,
  }) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://www.petz.com.br/blog/wp-content/uploads/2020/01/vira-lata-caramelo-pet.jpg',
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Text(postId).headline3(),
                  ),
                  iconAndText(
                      icon: Icons.question_mark,
                      text: 'Situação: Perdido/Encontrado'),
                  iconAndText(icon: Icons.pets, text: 'Espécie: Cão'),
                  iconAndText(icon: Icons.badge, text: 'Raça: SRD'),
                  iconAndText(icon: Icons.brush, text: 'Cor: Marrom'),
                  iconAndText(
                      icon: Icons.calendar_month, text: 'Idade: Adulto'),
                  iconAndText(
                    icon: Icons.call,
                    text: 'Contato: (65) 985634587',
                  ),
                  iconAndText(
                      icon: Icons.location_city, text: 'Cidade: Cuiabá - MT'),
                  iconAndText(
                    icon: Icons.location_on,
                    text: 'Endereço: Rua das Camélias, 962,',
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
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
        padding: const EdgeInsets.only(right: 6),
        child: Icon(
          icon,
          size: 18,
        ),
      ),
      Text(
        text,
      ).body2(
        style: const TextStyle(height: 1.75),
      ),
    ],
  );
}
