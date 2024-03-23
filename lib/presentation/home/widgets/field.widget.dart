import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class HomeField extends StatelessWidget {
  final String? label;
  final double? fieldHeight;
  final bool? flip;
  final bool? isEmpty;
  final Color? emptyColor;
  final String? emptyText;
  final String? icon;
  final Widget? child;
  final void Function()? onTap;

  const HomeField({
    super.key,
    this.label,
    this.fieldHeight,
    this.flip,
    this.isEmpty = false,
    this.emptyColor,
    this.emptyText,
    this.icon,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: Fonts.semiBold(
            color: Hues.greyDarkest,
            size: 12,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: fieldHeight ?? 46.h,
            width: double.maxFinite,
            margin: EdgeInsets.only(
              top: 4.h,
              bottom: isEmpty == true ? 0 : 12.h,
            ),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: Hues.greyDarkest,
              ),
              borderRadius: BorderRadius.circular(4.w),
            ),
            child: Stack(
              children: [
                child!,
                IgnorePointer(
                  ignoring: true,
                  child: Transform.flip(
                    flipX: flip!,
                    child: SizedBox(
                      height: 46.h,
                      width: 52.w,
                      child: Center(
                        child: SvgPicture.asset(
                          icon!,
                          fit: BoxFit.contain,
                          height: 30.w,
                          width: 30.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isEmpty == true,
          child: SizedBox(height: 4.h),
        ),
        Visibility(
          visible: isEmpty == true,
          child: Text(
            emptyText ?? "",
            style: Fonts.regular(
              color: emptyColor ?? Hues.red,
              size: 10,
            ),
          ),
        ),
        Visibility(
          visible: isEmpty == true && emptyColor == null,
          child: SizedBox(height: 12.h),
        ),
      ],
    );
  }
}
