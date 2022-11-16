import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/features/list_animals/presentation/widgets/settings_button.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 25),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 8, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _searchController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.colorNeutral_600,
                ),
                suffixIcon: const SettingsButton(),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                hintText: 'Pesquisar',
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.colorNeutral_600,
                  width: 2,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.colorDarkBlue_800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
