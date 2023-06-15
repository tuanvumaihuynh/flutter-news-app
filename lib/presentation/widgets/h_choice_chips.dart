import 'package:bloc_learning/presentation/blocs/setting/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HChoiceChips extends StatefulWidget {
  const HChoiceChips({super.key, required this.onSelected});

  final Function(String category) onSelected;

  @override
  State<HChoiceChips> createState() => _HChoiceChipsState();
}

class _HChoiceChipsState extends State<HChoiceChips> {
  int _selectedIndex = 0;

  SettingCubit get _settingCubit => context.read<SettingCubit>();

  @override
  Widget build(BuildContext context) {
    final categories = _settingCubit.state.categories;

    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: _selectedIndex == index,
              onSelected: (selected) {
                widget.onSelected.call(categories[index]);

                setState(() {
                  if (selected) {
                    _selectedIndex = index;
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
