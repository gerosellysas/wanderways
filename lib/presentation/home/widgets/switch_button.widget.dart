import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class HomeSwitchButton extends StatelessWidget {
  final int? languageSelected;
  final bool? enableRoundTrip;
  final List<bool>? locationEmpties;
  final void Function(bool)? onRoundTripChanged;

  const HomeSwitchButton({
    super.key,
    this.languageSelected,
    this.enableRoundTrip,
    this.locationEmpties,
    this.onRoundTripChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 177.h +
          (locationEmpties![0] ? 18.h : 0) +
          (locationEmpties![1] ? 18.h : 0),
      right: 0,
      child: Container(
        height: 52.h,
        width: 80.w,
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(height: 4.h),
            Text(
              languageSelected == 0 ? "Pulang-Pergi" : "Round-Trip",
              style: Fonts.regular(
                size: 10,
                color: enableRoundTrip! ? Hues.black : Hues.greyDarkest,
              ),
            ),
            SizedBox(height: 4.h),
            FlutterSwitch(
              height: 18.h,
              width: 40.w,
              padding: 2.w,
              toggleSize: 16.w,
              activeColor: Hues.primary,
              inactiveColor: Hues.greyDark,
              toggleColor: enableRoundTrip! ? Hues.white : Hues.greyLight,
              switchBorder: Border.all(
                width: 0.5,
                color: enableRoundTrip! ? Hues.secondary : Hues.greyDarkest,
              ),
              value: enableRoundTrip!,
              onToggle: onRoundTripChanged!,
            ),
          ],
        ),
      ),
    );
  }
}
