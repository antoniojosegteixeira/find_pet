import 'package:find_pet/core/routes/routes.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:find_pet/core/utils/validations.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';

class EmailConfirmationPage extends StatefulWidget {
  const EmailConfirmationPage({Key? key}) : super(key: key);

  @override
  State<EmailConfirmationPage> createState() => _EmailConfirmationPageState();
}

class _EmailConfirmationPageState extends State<EmailConfirmationPage> {
  @override
  void initState() {
    bloc = Modular.get<RegisterBloc>();
    super.initState();
  }

  late final RegisterBloc bloc;
  final _codeController = TextEditingController();
  final AppBar _appBar = AppBar();

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
                const Text('Confirmação de Email').headline3(),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                const Text(
                  'Um código de confirmação foi enviado para seu email. Por favor, insira o código: ',
                ).body2(color: AppColors.colorNeutral_600),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _codeController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    hintText: 'Código',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                          8,
                          8,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  child: const Text("Enviar"),
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
