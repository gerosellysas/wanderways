import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: Container(
        height: 100.h,
        width: 193.w,
        margin: EdgeInsets.only(top: 16.h),
        child: SvgPicture.asset(
          Images.logoFull,
          fit: BoxFit.contain,
          height: 100.h,
          width: 193.w,
        ),
      ),
    );
  }
}
