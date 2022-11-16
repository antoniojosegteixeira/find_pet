import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    bloc = Modular.get<ProfileBloc>();
    super.initState();
  }

  final AppBar _appBar = AppBar(
    title: const Text(
      'Minha Conta',
    ),
    centerTitle: true,
  );
  late final ProfileBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _appBar,
        backgroundColor: AppColors.colorNeutral_50,
        body: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.colorNeutral_200,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.colorNeutral_600,
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
                const Text(
                  'Antônio José Galvão da Cruz Teixeira',
                  textAlign: TextAlign.center,
                ).headline4(),
                const Spacer(flex: 3),
                const Text(
                  'Email',
                ).body2(color: AppColors.colorNeutral_600),
                const Text(
                  'antonioantonio@gmail.com',
                ).body2(color: AppColors.colorNeutral_900),
                const Spacer(flex: 3),
                const Text(
                  'Cidade',
                ).body2(color: AppColors.colorNeutral_600),
                const Text(
                  'Cuiabá',
                ).body2(color: AppColors.colorNeutral_900),
                const Spacer(flex: 3),
                const Text(
                  'Estado',
                ).body2(color: AppColors.colorNeutral_600),
                const Text(
                  'MT',
                ).body2(color: AppColors.colorNeutral_900),
                const Spacer(flex: 3),
                const Text(
                  'País',
                ).body2(color: AppColors.colorNeutral_600),
                const Text(
                  'Brasil',
                ).body2(color: AppColors.colorNeutral_900),
                const Spacer(
                  flex: 20,
                ),
                MainButton(
                  text: "Editar Informações",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
