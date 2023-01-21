import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/widgets/navigation_drawer.dart';
import 'package:find_pet/features/list_animals/presentation/pages/list_success_page.dart';
import 'package:find_pet/features/list_animals/presentation/widgets/search_field.dart';
import 'package:find_pet/features/user_posts/presentation/bloc/user_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserPostsPage extends StatefulWidget {
  const UserPostsPage({Key? key}) : super(key: key);

  @override
  State<UserPostsPage> createState() => _UserPostsPageState();
}

class _UserPostsPageState extends State<UserPostsPage> {
  final UserPostsBloc bloc = Modular.get<UserPostsBloc>();

  @override
  void initState() {
    bloc.add(GetUserAnimalList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('FindPet'),
        centerTitle: true,
        backgroundColor: AppColors.colorDarkBlue_800,
      ),
      body: SafeArea(
        child: BlocProvider.value(
          value: bloc,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(children: [
                  SizedBox(
                    height: 65,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SearchField(),
                      ],
                    ),
                  ),
                  BlocBuilder<UserPostsBloc, UserPostsState>(
                    builder: (context, state) {
                      if (state is UserPostsLoading) {
                        return const Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (state is UserPostsDone) {
                        return Expanded(
                          child: ListSuccessPage(
                            listAnimalsPage: state.userPostsPage,
                          ),
                        );
                      }
                      if (state is UserPostsError) {
                        return const Expanded(
                          child: Text('Erro'),
                        );
                      }
                      return const Expanded(
                        child: Text('Nenhum resultado'),
                      );
                    },
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
