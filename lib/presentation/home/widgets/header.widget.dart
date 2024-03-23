import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class HomeHeader extends StatelessWidget {
  final int? languageSelected;

  const HomeHeader({
    super.key,
    this.languageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Text(
          languageSelected == 0
              ? "Temukan rutenya, mari mulai perjalanan!"
              : "Find a route, let's make a journey!",
          style: Fonts.bold(
            color: Hues.white,
            size: 16,
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
