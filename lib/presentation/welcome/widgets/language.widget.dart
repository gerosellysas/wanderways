import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

import 'language_menu.widget.dart';

class WelcomeLanguage extends StatelessWidget {
  final AnimationController? animation;
  final int? selectedLanguage;
  final void Function()? onTap;
  final void Function(int?)? onMenuTap;

  const WelcomeLanguage({
    super.key,
    this.animation,
    this.selectedLanguage,
    this.onTap,
    this.onMenuTap,
  });

  double get _height => 36.h;

  double get _width => 190.w;

  double get _radius => (_height / 2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(_radius),
              color: Hues.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(_radius),
                highlightColor: Hues.secondary.withOpacity(0.16),
                splashColor: Hues.secondary.withOpacity(0.16),
                onTap: onTap,
                child: Container(
                  height: _height,
                  width: _width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_radius),
                  ),
                ),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Container(
                height: _height,
                width: _width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 6.w),
                    SvgPicture.asset(
                      Images.language,
                      fit: BoxFit.contain,
                      height: 24.w,
                      width: 24.w,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      selectedLanguage == 0 ? "Bahasa Indonesia" : "English",
                      style: Fonts.semiBold(
                        color: Hues.primary,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(width: 18.w),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        WelcomeLanguageMenu(
          animation: animation!,
          selectedValue: selectedLanguage!,
          onTap: onMenuTap,
        ),
      ],
    );
  }
}
