import 'package:flutter/material.dart';
import 'package:wander_ways/presentation/components/components.dart';

class HomeDropDown extends StatelessWidget {
  final String? hint;
  final List<String>? items;
  final String? selected;
  final void Function(String?)? onChanged;

  const HomeDropDown({
    super.key,
    this.hint,
    this.items,
    this.selected,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropDown(
      hint: hint,
      items: items,
      selected: selected,
      onChanged: onChanged,
    );
  }
}
