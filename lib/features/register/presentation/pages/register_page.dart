import 'package:find_pet/core/routes/routes.dart';
import 'package:find_pet/core/utils/validations.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _saveForm(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    bloc = Modular.get<RegisterBloc>();
    super.initState();
  }

  final AppBar _appBar = AppBar();
  bool _showPassword = false;
  late RegisterBloc bloc;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = (size.height - _appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _appBar,
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is RegisterDone) {
                  return const Text(
                      'Sua conta foi criada! Por favor, faça login');
                }
                if (state is RegisterError) {
                  return const Text('Erro');
                }
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const Text('Cadastro').headline3(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          'Bem vindo a FindPet! Adicione seu email e senha para continuar o cadastro',
                        ).body2(color: AppColors.colorNeutral_600),
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorDarkBlue_800,
                            ),
                          ),
                        ),
                        validator: Validations.validateMail,
                      ),
                      SizedBox(
                        height: screenHeight / 70,
                      ),
                      TextFormField(
                        controller: _passController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _showPassword == false ? true : false,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _showPassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.colorDarkBlue_800,
                            ),
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorDarkBlue_800,
                            ),
                          ),
                        ),
                        validator: Validations.validatePasscode,
                      ),
                      SizedBox(
                        height: screenHeight / 70,
                      ),
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Nome Completo',
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorDarkBlue_800,
                            ),
                          ),
                        ),
                        validator: Validations.validateName,
                      ),
                      SizedBox(
                        height: screenHeight / 70,
                      ),
                      TextFormField(
                        controller: _cityController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Cidade',
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorDarkBlue_800,
                            ),
                          ),
                        ),
                        validator: Validations.validateRequired,
                      ),
                      SizedBox(
                        height: screenHeight / 70,
                      ),
                      TextFormField(
                        controller: _stateController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Estado',
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorDarkBlue_800,
                            ),
                          ),
                        ),
                        validator: Validations.validateRequired,
                      ),
                      SizedBox(
                        height: screenHeight / 70,
                      ),
                      TextFormField(
                        controller: _countryController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'País',
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorDarkBlue_800,
                            ),
                          ),
                        ),
                        validator: Validations.validateRequired,
                      ),
                      SizedBox(
                        height: screenHeight / 70,
                      ),
                      MainButton(
                        text: 'ENVIAR',
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          bloc.add(
                            RegisterUser(
                              email: _emailController.text,
                              password: _passController.text,
                              username: _passController.text,
                              city: _cityController.text,
                              state: _stateController.text,
                              country: _countryController.text,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
