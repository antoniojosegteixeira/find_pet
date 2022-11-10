import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:find_pet/core/utils/validations.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/Dropdown.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/filled_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasicInformationsPage extends StatefulWidget {
  const BasicInformationsPage({Key? key}) : super(key: key);

  @override
  State<BasicInformationsPage> createState() => _BasicInformationsPageState();
}

class _BasicInformationsPageState extends State<BasicInformationsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bloc = Modular.get<PostAnimalBloc>();

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

  late final TextEditingController _nameController;
  late final TextEditingController _breedController;
  late final TextEditingController _colorController;

  final _appBar = AppBar(
    backgroundColor: AppColors.colorDarkBlue_800,
    foregroundColor: Colors.white,
  );

  @override
  void initState() {
    _nameController = TextEditingController(text: bloc.name);
    _breedController = TextEditingController(text: bloc.breed);
    _colorController = TextEditingController(text: bloc.color);
    super.initState();
  }

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
                          labelText('Qual é a espécie do animal?', true),
                          const SizedBox(height: 17),
                          Center(
                            child: Dropdown(
                              currentValue: bloc.species,
                              onChanged: (value) {
                                bloc.species = value;
                                setState(() {});
                              },
                              items: species,
                            ),
                          ),
                          const SizedBox(height: 20),
                          labelText('Qual o sexo do animal?', false),
                          const SizedBox(height: 17),
                          Center(
                            child: Dropdown(
                              currentValue: bloc.sex,
                              onChanged: (value) {
                                bloc.sex = value;
                                setState(() {});
                              },
                              items: sex,
                            ),
                          ),
                          const SizedBox(height: 20),
                          labelText(
                            'O animal possui algum tipo de identificação (coleira com nome por exemplo)?',
                            false,
                          ),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _nameController,
                            hint: 'Nome',
                          ),
                          const SizedBox(height: 20),
                          labelText('Possui raça definida?', false),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _breedController,
                            hint: 'Raça',
                          ),
                          const SizedBox(height: 20),
                          labelText('Qual a cor do animal?', true),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _colorController,
                            hint: 'Cor',
                            validator: Validations.validateRequired,
                          ),
                          const SizedBox(height: 20),
                          labelText('Qual a idade aparente do animal?', true),
                          const SizedBox(height: 17),
                          Center(
                            child: Dropdown(
                              currentValue: bloc.age,
                              onChanged: (value) {
                                bloc.age = value;
                                setState(() {});
                              },
                              items: ages,
                            ),
                          ),
                          const SizedBox(height: 30),
                          MainButton(
                            disabled: (bloc.species == null ||
                                _colorController.text.isEmpty ||
                                bloc.age == null),
                            text: 'Próximo',
                            onPressed: () {
                              bloc.name = _nameController.text;
                              bloc.breed = _breedController.text;
                              bloc.color = _colorController.text;

                              if (bloc.species != null &&
                                  _formKey.currentState!.validate() &&
                                  bloc.age != null) {
                                Modular.to.pushNamed('/post-animal/add-photo/');
                              }
                            },
                            backgroundColor: AppColors.colorGreenSuccess_300,
                          ),
                          const SizedBox(
                            height: 26,
                          ),
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

Widget labelText(String text, bool isRequired) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: const TextStyle(
              fontFamily: 'bodyfont',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              height: 1.25,
            ),
          ),
          if (isRequired) ...[
            const TextSpan(
              text: ' *',
              style: TextStyle(
                fontFamily: 'bodyfont',
                fontSize: 20,
                color: Colors.red,
                height: 0.8,
              ),
            ),
          ]
        ],
      ),
    ),
  );
}
