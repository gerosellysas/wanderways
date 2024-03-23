import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class HomeDate extends StatelessWidget {
  final String? hint;

  const HomeDate({
    super.key,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 52.w),
      alignment: Alignment.centerLeft,
      child: Text(
        hint!,
        style: Fonts.regular(),
      ),
    );
  }
}
