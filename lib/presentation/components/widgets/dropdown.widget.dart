import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class DropDown extends StatelessWidget {
  final String? hint;
  final String? selected;
  final List<String>? items;
  final Offset? itemsOffset;
  final void Function(String?)? onChanged;

  const DropDown({
    super.key,
    this.hint,
    this.selected,
    this.items,
    this.itemsOffset,
    this.onChanged,
  });

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                item,
                style: Fonts.regular(),
              ),
            ),
          ),
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                color: Hues.greyDark,
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items!.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(36.h);
      }
      if (i.isOdd) {
        itemsHeights.add(4.h);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        hint: hint != null
            ? Text(
                hint!,
                style: Fonts.italic(color: Hues.greyDarkest),
              )
            : null,
        items: _addDividersAfterItems(items!),
        value: selected,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 46.h,
          width: 1.sw - 96.w,
          padding: EdgeInsets.only(left: hint != null ? 52.w : 44.w),
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 2,
          maxHeight: 200.h,
          width: 1.sw - 72.w,
          offset: itemsOffset ?? Offset(-12.w, 0),
          decoration: BoxDecoration(
            color: Hues.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          customHeights: _getCustomItemsHeights(),
        ),
        iconStyleData: const IconStyleData(
          icon: SizedBox(),
          openMenuIcon: SizedBox(),
        ),
      ),
    );
  }
}
