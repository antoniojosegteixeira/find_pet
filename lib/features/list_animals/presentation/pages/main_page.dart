import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/widgets/navigation_drawer.dart';
import 'package:find_pet/features/list_animals/presentation/pages/list_success_page.dart';
import 'package:find_pet/features/list_animals/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
                    children: [
                      SearchField(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListSuccessPage(),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
