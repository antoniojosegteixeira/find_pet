import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({
    Key? key,
    required this.items,
    required this.currentValue,
    required this.onChanged,
  }) : super(key: key);

  final List items;
  final dynamic currentValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                'Selecione',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.colorNeutral_600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorNeutral_800,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: currentValue,
        onChanged: (value) {
          onChanged(value);
        },
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        iconSize: 14,
        iconEnabledColor: AppColors.colorNeutral_600,
        iconDisabledColor: AppColors.colorNeutral_600,
        buttonHeight: 50,
        buttonWidth: MediaQuery.of(context).size.width,
        buttonPadding: const EdgeInsets.only(left: 18, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.black26,
          ),
          color: Colors.white,
        ),
        buttonElevation: 2,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 18, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: MediaQuery.of(context).size.width - 50,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-0, 0),
      ),
    );
  }
}
