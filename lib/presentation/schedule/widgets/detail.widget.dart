import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class ScheduleDetail extends StatelessWidget {
  final int? languageSelected;
  final String? date;
  final String? seat;
  final void Function()? onTap;

  const ScheduleDetail({
    super.key,
    this.languageSelected,
    this.date,
    this.seat,
    this.onTap,
  });

  double get _height => 36.h;

  double get _rowWidth => (1.sw - 20.w) / 2;

  double get _iconSize => 24.w;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: _height,
        width: double.maxFinite,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(
            color: Hues.primary,
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: _height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _rowWidth,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Container(
                          height: _iconSize,
                          width: _iconSize,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            Images.calendar,
                            fit: BoxFit.contain,
                            height: _iconSize,
                            width: _iconSize,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          date!,
                          style: Fonts.regular(size: 13),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                    child: VerticalDivider(
                      color: Hues.primary,
                      width: 1.w,
                    ),
                  ),
                  Container(
                    width: _rowWidth,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        Container(
                          height: _iconSize,
                          width: _iconSize,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            Images.seat,
                            fit: BoxFit.contain,
                            height: _iconSize,
                            width: _iconSize,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          seat!,
                          style: Fonts.regular(size: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _height,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                languageSelected == 0 ? "Ganti" : "Change",
                style: Fonts.regular(
                  color: Hues.primary,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
