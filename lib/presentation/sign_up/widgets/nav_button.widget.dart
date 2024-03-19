import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SignUpNavButton extends StatelessWidget {
  final int? languageSelected;
  final bool? loading;
  final void Function()? onTap;

  const SignUpNavButton({
    super.key,
    this.languageSelected,
    this.loading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return loading!
        ? Container(
            height: 40.h,
            width: 304.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Hues.primary,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Hues.white,
              size: 24.w,
            ),
          )
        : NavButton(
            text: languageSelected == 0 ? "Daftar" : "Register",
            onTap: onTap,
          );
  }
}
