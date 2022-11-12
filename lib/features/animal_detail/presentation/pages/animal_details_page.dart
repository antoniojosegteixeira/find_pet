import 'package:find_pet/features/animal_detail/presentation/bloc/animal_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimalDetailsPage extends StatefulWidget {
  const AnimalDetailsPage({
    Key? key,
    required this.postId,
  }) : super(key: key);

  final String postId;

  @override
  State<AnimalDetailsPage> createState() => _AnimalDetailsPageState();
}

class _AnimalDetailsPageState extends State<AnimalDetailsPage> {
  final AnimalDetailBloc bloc = Modular.get<AnimalDetailBloc>();
  @override
  void initState() {
    bloc.add(GetAnimalDetail(id: widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => bloc,
        child: SafeArea(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: BlocBuilder<AnimalDetailBloc, AnimalDetailState>(
                  builder: (context, state) {
                    if (state is AnimalDetailLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is AnimalDetailError) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }

                    if (state is AnimalDetailDone) {
                      final result = state.animalDetail;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Image.network(
                            'https://www.petz.com.br/blog/wp-content/uploads/2020/01/vira-lata-caramelo-pet.jpg',
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Text(result.name ??
                                    '${result.breed} - ${result.color}')
                                .headline3(),
                          ),
                          iconAndText(
                              icon: Icons.question_mark,
                              text: 'Situação: ${result.postType}'),
                          iconAndText(
                              icon: Icons.pets,
                              text: 'Espécie: ${result.species}'),
                          iconAndText(
                              icon: Icons.badge,
                              text: 'Raça:  ${result.breed}'),
                          iconAndText(
                              icon: Icons.brush, text: 'Cor:  ${result.color}'),
                          iconAndText(
                              icon: Icons.calendar_month,
                              text: 'Idade:  ${result.age}'),
                          iconAndText(
                            icon: Icons.call,
                            text: 'Contato:  ${result.contact}',
                          ),
                          iconAndText(
                              icon: Icons.location_city,
                              text:
                                  'Cidade:  ${result.city} -  ${result.state}'),
                          iconAndText(
                            icon: Icons.location_on,
                            text: 'Endereço:  ${result.address}',
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
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
