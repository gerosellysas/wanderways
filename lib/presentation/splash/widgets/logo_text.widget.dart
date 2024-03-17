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
        begin: 14.5.w,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.55, 0.75),
          reverseCurve: const Interval(0.55, 0.75),
        ),
      );

  Animation<double> get _opacity => Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0.25, 0.5),
          reverseCurve: const Interval(0.25, 0.5),
        ),
      );

  Animation<double> _padding({required double endTween}) => Tween<double>(
        begin: 0,
        end: endTween.w,
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
          SizedBox(height: 34.17.w),
          Stack(
            children: [
              AnimatedBuilder(
                  animation: animation!,
                  child: SvgPicture.asset(
                    Images.logoTextTop,
                    fit: BoxFit.contain,
                    height: 38.w,
                    width: 134.w,
                  ),
                  builder: (context, child) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: _padding(endTween: 146).value,
                      ),
                      child: FadeTransition(
                        opacity: _opacity,
                        child: child!,
                      ),
                    );
                  }),
              Container(
                height: 38.w,
                width: 146.w,
                color: Hues.primary,
              ),
            ],
          ),
          SizedBox(height: 8.w),
          Stack(
            children: [
              AnimatedBuilder(
                  animation: animation!,
                  child: SvgPicture.asset(
                    Images.logoTextBottom,
                    fit: BoxFit.contain,
                    height: 38.w,
                    width: 78.w,
                  ),
                  builder: (context, child) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: _padding(endTween: 124.06).value,
                      ),
                      child: FadeTransition(
                        opacity: _opacity,
                        child: child!,
                      ),
                    );
                  }),
              Container(
                height: 38.w,
                width: 124.06.w,
                color: Hues.primary,
              ),
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
