import 'package:find_pet/core/utils/validations.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    bloc = Modular.get<LoginBloc>();
    super.initState();
  }

  final AppBar _appBar = AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: AppColors.colorDarkBlue_900,
  );
  bool _showPassword = false;
  late final LoginBloc bloc;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

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
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return Flex(
                    direction: Axis.vertical,
                    children: const [
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    ],
                  );
                }

                if (state is LoginDone) {
                  Modular.to.navigate('/search-animals/');
                }
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      const Text('Login').headline3(),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          'Bem vindo novamente a FindPet! Adicione seu email e senha para continuar o login.',
                        ).body2(color: AppColors.colorNeutral_600),
                      ),
                      const Spacer(),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validations.validateMail,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.colorDarkBlue_800,
                            ),
                          ),
                        ),
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
                      const Spacer(
                        flex: 20,
                      ),
                      MainButton(
                        text: 'LOGIN',
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          bloc.add(
                            DoLogin(
                              email: _emailController.text,
                              password: _passController.text,
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
