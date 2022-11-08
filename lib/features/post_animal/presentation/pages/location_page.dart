import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:find_pet/core/utils/validations.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/Dropdown.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/filled_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bloc = Modular.get<PostAnimalBloc>();

  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();

  final List<String> countrystates = [
    'Acre',
    'Alagoas',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Distrito Federal',
    'Espirito Santo',
    'Goiás',
    'Maranhão',
    'Mato Grosso do Sul',
    'Mato Grosso',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraima',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins',
  ];

  String? selectedState;

  final _appBar = AppBar(
    backgroundColor: AppColors.colorDarkBlue_800,
    foregroundColor: Colors.white,
  );

  void addInformationToBloc() {
    if (selectedState != null) bloc.species = selectedState as String;
    bloc.contact = _contactController.text;
    bloc.address = _addressController.text;
    bloc.city = _cityController.text;
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
                              'Localização e Contato',
                            ).headline3(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          labelText('Estado', true),
                          const SizedBox(height: 17),
                          Center(
                            child: Dropdown(
                              currentValue: selectedState,
                              onChanged: (value) {
                                setState(
                                  () {
                                    selectedState = value;
                                  },
                                );
                              },
                              items: countrystates,
                            ),
                          ),
                          const SizedBox(height: 20),
                          labelText(
                            'Adicione a cidade',
                            true,
                          ),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _cityController,
                            validator: Validations.validateRequired,
                            hint: 'Cidade',
                          ),
                          const SizedBox(height: 20),
                          labelText(
                            'Adicione o endereço',
                            true,
                          ),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _addressController,
                            validator: Validations.validateRequired,
                            hint: 'Endereço',
                            maxLines: 3,
                          ),
                          const SizedBox(height: 20),
                          labelText(
                            'Adicione informações de contato: telefone, redes sociais, etc',
                            true,
                          ),
                          const SizedBox(height: 17),
                          FilledInput(
                            controller: _contactController,
                            hint: 'Informações de Contato',
                            validator: Validations.validateRequired,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 30),
                          MainButton(
                            disabled: false,
                            text: 'Próximo',
                            onPressed: () {
                              addInformationToBloc();
                              Modular.to.navigate('/post-animal/post-done/');
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
