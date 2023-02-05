import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/widgets/text_input.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Pesquisa avançada'),
        centerTitle: true,
        backgroundColor: AppColors.colorDarkBlue_800,
      ),
      body: Column(children: const [
        TextInput(
          hintText: 'Nome do animal',
        ),
      ]),
    );
  }
}
