import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class HomeSwapButton extends StatelessWidget {
  final void Function()? onTap;

  const HomeSwapButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 42.h,
      right: 8.w,
      child: Stack(
        children: [
          Container(
            height: 48.w,
            width: 48.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Hues.white,
            ),
          ),
          SizedBox(
            height: 48.w,
            width: 48.w,
            child: SvgPicture.asset(
              Images.swap,
              fit: BoxFit.contain,
              height: 48.w,
              width: 48.w,
            ),
          ),
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              highlightColor: Hues.secondary.withOpacity(0.16),
              splashColor: Hues.secondary.withOpacity(0.16),
              onTap: onTap,
              child: SizedBox(
                height: 48.w,
                width: 48.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
