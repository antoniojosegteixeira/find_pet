import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/widgets/navigation_drawer.dart';
import 'package:find_pet/features/list_animals/presentation/bloc/list_animals_bloc.dart';
import 'package:find_pet/features/list_animals/presentation/pages/list_success_page.dart';
import 'package:find_pet/features/list_animals/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ListAnimalsBloc bloc = Modular.get<ListAnimalsBloc>();

  @override
  void initState() {
    bloc.add(GetAnimalsList());
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
                  BlocBuilder<ListAnimalsBloc, ListAnimalsState>(
                    builder: (context, state) {
                      if (state is ListAnimalsLoading) {
                        return const Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (state is ListAnimalsDone) {
                        return Expanded(
                          child: ListSuccessPage(
                            listAnimalsPage: state.listAnimalsPage,
                          ),
                        );
                      }
                      if (state is ListAnimalsError) {
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
