import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class SplashLogoText extends StatelessWidget {
  final AnimationController? animation;

  const SplashLogoText({
    super.key,
    this.animation,
  });

  Animation<double> get _topPadding => Tween<double>(
        begin: 14.5.h,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.55, 0.75),
          reverseCurve: const Interval(0.55, 0.75),
        ),
      );

  Animation<double> get _fadeIn => Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.25, 0.5),
          reverseCurve: const Interval(0.25, 0.5),
        ),
      );

  Animation<double> get _fadeOut => Tween<double>(
        begin: 1,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.45, 0.5),
          reverseCurve: const Interval(0.45, 0.5),
        ),
      );

  Animation<double> _padding({required double endTween}) => Tween<double>(
        begin: 0,
        end: endTween,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.25, 0.5),
          reverseCurve: const Interval(0.25, 0.5),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 34.17.h),
          Stack(
            children: [
              AnimatedBuilder(
                  animation: animation!,
                  child: Container(
                    height: 38.h,
                    width: 134.w,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      Images.logoTextTop,
                      fit: BoxFit.contain,
                      height: 38.h,
                      width: 134.w,
                    ),
                  ),
                  builder: (context, child) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: _padding(endTween: 146.w).value,
                      ),
                      child: FadeTransition(
                        opacity: _fadeIn,
                        child: child!,
                      ),
                    );
                  }),
              AnimatedBuilder(
                  animation: animation!,
                  child: Container(
                    height: 38.h,
                    width: 146.w,
                    color: Hues.primary,
                  ),
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeOut,
                      child: child,
                    );
                  }),
            ],
          ),
          SizedBox(height: 10.h),
          Stack(
            children: [
              AnimatedBuilder(
                  animation: animation!,
                  child: Container(
                    height: 36.h,
                    width: 77.w,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      Images.logoTextBottom,
                      fit: BoxFit.contain,
                      height: 36.h,
                      width: 77.w,
                    ),
                  ),
                  builder: (context, child) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: _padding(endTween: 125.13.w).value,
                      ),
                      child: FadeTransition(
                        opacity: _fadeIn,
                        child: child!,
                      ),
                    );
                  }),
              AnimatedBuilder(
                  animation: animation!,
                  child: Container(
                    height: 36.h,
                    width: 125.13.w,
                    color: Hues.primary,
                  ),
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeOut,
                      child: child,
                    );
                  }),
            ],
          ),
        ],
      ),
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(top: _topPadding.value),
          child: child!,
        );
      },
    );
  }
}
