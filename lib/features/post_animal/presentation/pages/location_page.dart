import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:find_pet/core/utils/validations.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/Dropdown.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/filled_input.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final PostAnimalBloc bloc;

  late final TextEditingController _cityController;
  late final TextEditingController _addressController;
  late final TextEditingController _contactController;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<PostAnimalBloc>();
    _cityController = TextEditingController(text: bloc.city);
    _addressController = TextEditingController(text: bloc.address);
    _contactController = TextEditingController(text: bloc.contact);
  }

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
      body: BlocProvider.value(
        value: bloc,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SafeArea(
              child: BlocBuilder<PostAnimalBloc, PostAnimalState>(
                builder: (context, state) {
                  if (state is PostAnimalDone) {
                    Modular.to.navigate('/post-animal/post-done/');
                  }
                  return SizedBox(
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
                                const LabelText(
                                  text: 'Estado',
                                  isRequired: true,
                                ),
                                const SizedBox(height: 17),
                                Center(
                                  child: Dropdown(
                                    currentValue: bloc.countrystate,
                                    onChanged: (value) {
                                      bloc.countrystate = value;
                                      setState(() {});
                                    },
                                    items: countrystates,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const LabelText(
                                  text: 'Adicione a cidade',
                                  isRequired: true,
                                ),
                                const SizedBox(height: 17),
                                FilledInput(
                                  controller: _cityController,
                                  validator: Validations.validateRequired,
                                  hint: 'Cidade',
                                ),
                                const SizedBox(height: 20),
                                const LabelText(
                                  text: 'Adicione o endereço',
                                  isRequired: true,
                                ),
                                const SizedBox(height: 17),
                                FilledInput(
                                  controller: _addressController,
                                  validator: Validations.validateRequired,
                                  hint: 'Endereço',
                                  maxLines: 3,
                                ),
                                const SizedBox(height: 20),
                                const LabelText(
                                  text:
                                      'Adicione informações de contato: telefone, redes sociais, etc',
                                  isRequired: true,
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
                                  disabled: bloc.countrystate == null,
                                  text: 'Enviar',
                                  backgroundColor:
                                      AppColors.colorGreenSuccess_300,
                                  onPressed: () {
                                    if (bloc.countrystate != null &&
                                        _formKey.currentState!.validate()) {
                                      bloc.city = _cityController.text;
                                      bloc.address = _addressController.text;
                                      bloc.contact = _contactController.text;

                                      bloc.add(PostAnimal());
                                    }
                                  },
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
                  );
                },
              ),
            );
          },
        ),
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
