import 'package:flutter/material.dart';
import 'package:wander_ways/presentation/components/components.dart';

class HomeDropDown extends StatelessWidget {
  final String? hint;
  final String? selected;
  final List<String>? items;
  final Offset? itemsOffset;
  final void Function(String?)? onChanged;

  const HomeDropDown({
    super.key,
    this.hint,
    this.selected,
    this.items,
    this.itemsOffset,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropDown(
      hint: hint,
      items: items,
      itemsOffset: itemsOffset,
      selected: selected,
      onChanged: onChanged,
    );
  }
}
