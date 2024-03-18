import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class WelcomeLanguageMenu extends StatelessWidget {
  final AnimationController? animation;
  final int? selectedValue;
  final void Function(int?)? onTap;

  const WelcomeLanguageMenu({
    super.key,
    this.animation,
    this.selectedValue,
    this.onTap,
  });

  Animation<double> get _height => Tween<double>(
        begin: 0,
        end: 112.h,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  Animation<double> get _padding => Tween<double>(
        begin: 0,
        end: 8.h,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  Animation<double> get _radius => Tween<double>(
        begin: 2.w,
        end: 8.w,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation!,
        child: Column(
          children: [
            _WelcomeLanguageMenuButton(
              key: key,
              animation: animation!,
              flag: Images.id,
              text: "Bahasa Indonesia",
              value: 0,
              selectedValue: selectedValue!,
              onTap: onTap,
            ),
            _WelcomeLanguageMenuButton(
              key: key,
              animation: animation!,
              flag: Images.en,
              text: "English",
              value: 1,
              selectedValue: selectedValue!,
              onTap: onTap,
            ),
          ],
        ),
        builder: (context, child) {
          return Container(
            height: _height.value,
            width: 240,
            padding: EdgeInsets.symmetric(vertical: _padding.value),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Hues.white,
              borderRadius: BorderRadius.circular(_radius.value),
              boxShadow: [
                BoxShadow(
                  offset: Offset.zero,
                  blurRadius: 4,
                  color: Hues.black.withOpacity(0.32),
                ),
              ],
            ),
            child: child!,
          );
        });
  }
}

class _WelcomeLanguageMenuButton extends StatelessWidget {
  final AnimationController? animation;
  final String? flag;
  final String? text;
  final int? value;
  final int? selectedValue;
  final void Function(int?)? onTap;

  const _WelcomeLanguageMenuButton({
    super.key,
    this.animation,
    this.flag,
    this.text,
    this.value,
    this.selectedValue,
    this.onTap,
  });

  Animation<double> get _opacity => Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  Animation<double> get _buttonHeight => Tween<double>(
        begin: 0,
        end: 48.h,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  Animation<double> get _iconHeight => Tween<double>(
        begin: 0,
        end: 16.w,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  Animation<double> get _radioSize => Tween<double>(
        begin: 0,
        end: 20.w,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  Animation<double> get _radioScale => Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          color: Hues.white,
          child: InkWell(
            highlightColor: Hues.secondary.withOpacity(0.32),
            splashColor: Hues.secondary.withOpacity(0.32),
            onTap: () => onTap!(value!),
            child: AnimatedBuilder(
                animation: animation!,
                builder: (context, _) {
                  return SizedBox(
                    height: _buttonHeight.value,
                    width: double.maxFinite,
                  );
                }),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: AnimatedBuilder(
              animation: animation!,
              builder: (context, _) {
                return Container(
                  height: _buttonHeight.value,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      FadeTransition(
                        opacity: _opacity,
                        child: Container(
                          height: _iconHeight.value,
                          width: 22.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.25,
                              color: Hues.black,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: SvgPicture.asset(
                            flag!,
                            fit: BoxFit.fitHeight,
                            height: _iconHeight.value,
                            width: 22.w,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      FadeTransition(
                        opacity: _opacity,
                        child: Text(
                          text!,
                          style: Fonts.regular(),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      FadeTransition(
                        opacity: _opacity,
                        child: SizedBox(
                          height: _radioSize.value,
                          width: _radioSize.value,
                          child: Transform.scale(
                            scale: _radioScale.value,
                            child: Radio(
                              value: value!,
                              groupValue: selectedValue!,
                              splashRadius: 0.0,
                              activeColor: Hues.primary,
                              onChanged: onTap,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
