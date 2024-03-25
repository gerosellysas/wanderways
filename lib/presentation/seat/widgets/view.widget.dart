import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SeatView extends StatelessWidget {
  final int? languageSelected;
  final Widget? passenger;
  final Widget? selection;
  final void Function()? onBackTap;
  final void Function()? onContinueTap;

  const SeatView({
    super.key,
    this.languageSelected,
    this.passenger,
    this.selection,
    this.onBackTap,
    this.onContinueTap,
  });

  double get _topHeight => ScreenUtil().statusBarHeight + kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hues.greyLightest,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, _topHeight, 0, 0),
            child: Container(
              height: 1.sh - _topHeight,
              width: 1.sw,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Material(
                    color: Hues.white,
                    elevation: 6,
                    child: Container(
                      height: 100.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      child: passenger!,
                    ),
                  ),
                  selection!,
                  const Expanded(child: SizedBox()),
                  NavButton(
                    text: languageSelected == 0 ? "Lanjut" : "Continue",
                    onTap: onContinueTap,
                  ),
                  SizedBox(height: 48.h),
                ],
              ),
            ),
          ),
          TopBar(
            title: languageSelected == 0
                ? "Pemilihan Tempat Duduk"
                : "Seat Selection",
            style: TopBarStyle.enableBack,
            onBackTap: onBackTap,
          ),
        ],
      ),
    );
  }
}
