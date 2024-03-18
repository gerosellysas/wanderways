import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class SignInView extends StatelessWidget {
  final int? languageSelected;
  final Widget? nameField;
  final Widget? passwordField;
  final Widget? navButton;
  final void Function()? onSignUpTap;

  const SignInView({
    super.key,
    this.languageSelected,
    this.nameField,
    this.passwordField,
    this.navButton,
    this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hues.greyLightest,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Center(
              child: SvgPicture.asset(
                Images.logo,
                fit: BoxFit.contain,
                height: 110.h,
                width: 140.w,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              languageSelected == 0
                  ? "Mulai perjalanan Anda!"
                  : "Start your journey!",
              style: Fonts.bold(
                size: 20,
                color: Hues.primary,
              ),
            ),
            SizedBox(height: 36.h),
            nameField!,
            SizedBox(height: 12.h),
            passwordField!,
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                languageSelected == 0 ? "Lupa kata sandi?" : "Forgot password?",
                style: Fonts.semiBoldItalic(
                  color: Hues.primary,
                ),
              ),
            ),
            SizedBox(height: 36.h),
            navButton!,
            const Expanded(child: SizedBox()),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: languageSelected == 0
                    ? "Belum mempunyai akun? "
                    : "Don't have an account? ",
                style: Fonts.regular(),
                children: [
                  TextSpan(
                    text: languageSelected == 0 ? " Daftar" : " Sign up",
                    style: Fonts.semiBold(
                      color: Hues.primary,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onSignUpTap,
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
