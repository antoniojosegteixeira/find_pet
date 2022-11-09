import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostDonePage extends StatefulWidget {
  const PostDonePage({Key? key}) : super(key: key);

  @override
  State<PostDonePage> createState() => _PostDonePageState();
}

class _PostDonePageState extends State<PostDonePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                SizedBox(height: screenHeight / 5),
                Center(
                  child: Image.asset(
                    'assets/images/check.png',
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: const Text('Post Criado!').body1(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                MainButton(
                  disabled: false,
                  text: 'Próximo',
                  onPressed: () {
                    Modular.to.pushReplacementNamed('/user-posts/');
                  },
                  backgroundColor: AppColors.colorGreenSuccess_300,
                ),
                const SizedBox(
                  height: 26,
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
