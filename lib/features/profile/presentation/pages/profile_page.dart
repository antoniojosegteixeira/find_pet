import 'package:find_pet/core/utils/validations.dart';
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
    cubit = Modular.get<ProfileBloc>();
    super.initState();
  }

  final AppBar _appBar = AppBar();
  bool _showPassword = false;
  late final ProfileBloc cubit;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = (size.height - _appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (context) => cubit,
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
                const Spacer(
                  flex: 2,
                ),
                const Text('Profile').headline3(),
                const Spacer(),
                const Text(
                  'Now use your email and password to access your account. ',
                ).body2(color: AppColors.colorNeutral_600),
                const Spacer(),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
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
                SizedBox(
                  height: screenHeight / 70,
                ),
                TextFormField(
                  controller: _passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _showPassword == false ? true : false,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                          8,
                          8,
                        ),
                      ),
                    ),
                  ),
                  validator: Validations.validatePasscode,
                ),
                const Spacer(
                  flex: 20,
                ),
                ElevatedButton(
                  child: const Text("Profile"),
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
