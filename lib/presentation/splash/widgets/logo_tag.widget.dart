import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class SplashLogoTag extends StatelessWidget {
  final AnimationController? animation;

  const SplashLogoTag({
    super.key,
    this.animation,
  });

  Animation<double> get _padding => Tween<double>(
        begin: 14.5.w,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.55, 0.75),
          reverseCurve: const Interval(0.55, 0.75),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedBuilder(
              animation: animation!,
              child: SvgPicture.asset(
                Images.logoTag,
                fit: BoxFit.contain,
                height: 14.5.w,
                width: 280.w,
              ),
              builder: (context, child) {
                return Padding(
                  padding: EdgeInsets.only(bottom: _padding.value),
                  child: child!,
                );
              }),
          Container(
            height: 14.5.w,
            width: 280.w,
            margin: EdgeInsets.only(bottom: 14.5.w),
            color: Hues.primary,
          ),
        ],
      ),
    );
  }
}
