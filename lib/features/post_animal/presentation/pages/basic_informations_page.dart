import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:find_pet/core/utils/validations.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/Dropdown.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/filled_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasicInformationsPage extends StatefulWidget {
  const BasicInformationsPage({Key? key}) : super(key: key);

  @override
  State<BasicInformationsPage> createState() => _BasicInformationsPageState();
}

class _BasicInformationsPageState extends State<BasicInformationsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bloc = Modular.get<PostAnimalBloc>();

  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _colorController = TextEditingController();

  final List<String> species = [
    "Cão",
    "Gato",
    "Roedor ou Coelho",
    "Ave",
    "Réptil",
    "Cavalo",
    "Outro",
  ];

  final List<String> sex = ["Macho", "Fêmea"];

  final List<String> ages = [
    "Filhote",
    "Jovem",
    "Adulto",
  ];

  String? selectedSpecies;
  String? selectedSex;
  String? selectedAge;

  final _appBar = AppBar(
    backgroundColor: AppColors.colorDarkBlue_800,
    foregroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = (size.height - _appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.colorDarkBlue_800,
      appBar: _appBar,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SizedBox(
              height: screenHeight,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      height: screenHeight,
                      child: ListView(
                        children: [
                          const SizedBox(height: 46),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Informações Básicas',
                            ).headline3(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Align(
                            alignment: Alignment.centerLeft,
                            child:
                                const Text('Qual é a espécie do animal?').body2(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          Center(
                            child: Dropdown(
                              currentValue: selectedSpecies,
                              onChanged: (value) {
                                setState(
                                  () {
                                    selectedSpecies = value;
                                  },
                                );
                              },
                              items: species,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text('Qual o sexo do animal?').body2(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          Center(
                            child: Dropdown(
                              currentValue: selectedSex,
                              onChanged: (value) {
                                setState(
                                  () {
                                    selectedSex = value;
                                  },
                                );
                              },
                              items: sex,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                                    'O animal possui algum tipo de identificação (coleira com nome por exemplo)?')
                                .body2(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _nameController,
                            validator: Validations.validateRequired,
                            hint: 'Nome',
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text('Possui raça definida?').body2(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _breedController,
                            hint: 'Raça',
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text('Qual a cor do animal?').body2(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _colorController,
                            hint: 'Cor',
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child:
                                const Text('Qual a idade aparente do animal?')
                                    .body2(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          Center(
                            child: Dropdown(
                              currentValue: selectedAge,
                              onChanged: (value) {
                                setState(
                                  () {
                                    selectedAge = value;
                                  },
                                );
                              },
                              items: ages,
                            ),
                          ),
                          const SizedBox(height: 26),
                          MainButton(
                            disabled: true,
                            text: 'Próximo',
                            onPressed: () {
                              // todo: add bloc
                            },
                            backgroundColor: AppColors.colorGreenSuccess_300,
                          ),
                          const SizedBox(
                            height: 26,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

String transformOption(text) {
  if (text == 'Encontrei um animal') {
    return 'found';
  }

  return 'lost';
}
