import 'dart:io';

import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:find_pet/features/post_animal/presentation/widgets/pet_image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({Key? key}) : super(key: key);

  @override
  State<AddPhotoPage> createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  final bloc = Modular.get<PostAnimalBloc>();

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
                            'Adicione Fotos',
                          ).headline3(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                                'Adicione fotos do animal. Tente enquadrar o corpo inteiro e mostrar características importantes que facilitem a identificação, como manchas, acessórios, etc.')
                            .body2(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 17),
                        const Expanded(
                          child: PetImagePicker(),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        MainButton(
                          disabled: false,
                          text: 'Próximo',
                          onPressed: () {
                            Modular.to
                                .pushNamed('/post-animal/add-localization/');
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
          );
        },
      ),
    );
  }
}
