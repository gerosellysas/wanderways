import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';

class SplashLogo extends StatelessWidget {
  final AnimationController? animation;

  const SplashLogo({
    super.key,
    this.animation,
  });

  Animation<double> get _topPadding => Tween<double>(
        begin: 14.5.w,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.55, 0.75),
          reverseCurve: const Interval(0.55, 0.75),
        ),
      );

  Animation<AlignmentGeometry> get _alignment => Tween<AlignmentGeometry>(
        begin: Alignment.topCenter,
        end: Alignment.topLeft,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.3, 0.5),
          reverseCurve: const Interval(0.3, 0.5),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation!,
        child: SvgPicture.asset(
          Images.logo,
          fit: BoxFit.contain,
          height: 117.w,
          width: 150.w,
        ),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.only(top: _topPadding.value),
            child: AlignTransition(
              alignment: _alignment,
              child: child!,
            ),
          );
        });
  }
}
