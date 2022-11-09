import 'package:find_pet/core/utils/validations.dart';
import 'package:find_pet/core/widgets/navigation_drawer.dart';
import 'package:find_pet/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:find_pet/features/user_posts/presentation/bloc/user_posts_bloc.dart';
import 'package:find_pet/features/user_posts/presentation/widgets/user_animal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';

class UserPostsPage extends StatefulWidget {
  const UserPostsPage({Key? key}) : super(key: key);

  @override
  State<UserPostsPage> createState() => _UserPostsPageState();
}

class _UserPostsPageState extends State<UserPostsPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    bloc = Modular.get<UserPostsBloc>();
    super.initState();
  }

  final AppBar _appBar = AppBar(
    title: const Text(
      'Meus Posts',
    ),
    centerTitle: true,
  );
  late final UserPostsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: _appBar,
        backgroundColor: AppColors.colorNeutral_50,
        body: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
              ),
              children: const [
                UserAnimalCard(
                  species: 'Cão',
                  age: 'Jovem',
                  breed: 'SRD',
                  color: 'Marrom',
                  city: 'Cuiabá',
                  state: 'MT',
                ),
                UserAnimalCard(
                  species: 'Cão',
                  age: 'Jovem',
                  breed: 'SRD',
                  color: 'Marrom',
                  city: 'Cuiabá',
                  state: 'MT',
                ),
                UserAnimalCard(
                  species: 'Cão',
                  age: 'Jovem',
                  breed: 'SRD',
                  color: 'Marrom',
                  city: 'Cuiabá',
                  state: 'MT',
                ),
                UserAnimalCard(
                  species: 'Cão',
                  age: 'Jovem',
                  breed: 'SRD',
                  color: 'Marrom',
                  city: 'Cuiabá',
                  state: 'MT',
                ),
                UserAnimalCard(
                  species: 'Cão',
                  age: 'Jovem',
                  breed: 'SRD',
                  color: 'Marrom',
                  city: 'Cuiabá',
                  state: 'MT',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
