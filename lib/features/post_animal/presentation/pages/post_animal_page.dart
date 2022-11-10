import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/Dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostAnimalPage extends StatefulWidget {
  const PostAnimalPage({Key? key}) : super(key: key);

  @override
  State<PostAnimalPage> createState() => _PostAnimalPageState();
}

class _PostAnimalPageState extends State<PostAnimalPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bloc = Modular.get<PostAnimalBloc>();

  final List<String> items = [
    "Encontrei um animal",
    "Estou buscando um animal",
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
                      child: Column(
                        children: [
                          const SizedBox(height: 46),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Tipo de Post',
                            ).headline3(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                                  'Você encontrou um animal perdido ou está buscando por um?')
                              .body2(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                              child: Dropdown(
                            currentValue: bloc.postType,
                            onChanged: (value) {
                              bloc.postType = value;
                              setState(
                                () {},
                              );
                            },
                            items: items,
                          )),
                          const Spacer(),
                          MainButton(
                            disabled: bloc.postType == null,
                            text: 'Próximo',
                            onPressed: () {
                              Modular.to
                                  .pushNamed('/post-animal/basic-information/');
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
