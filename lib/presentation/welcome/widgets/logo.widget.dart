import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';

class WelcomeLogo extends StatelessWidget {
  const WelcomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: SizedBox(
        height: 145.h,
        width: 280.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SvgPicture.asset(
              Images.logoFull,
              fit: BoxFit.contain,
              height: 145.h,
              width: 280.w,
            ),
          ],
        ),
      ),
    );
  }
}
