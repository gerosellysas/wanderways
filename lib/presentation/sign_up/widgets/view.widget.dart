import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SignUpView extends StatelessWidget {
  final int? languageSelected;
  final bool? canPop;
  final Widget? firstNameField;
  final Widget? lastNameField;
  final Widget? emailField;
  final Widget? phoneField;
  final Widget? passwordField;
  final Widget? confirmPassField;
  final Widget? navButton;
  final void Function()? onSignInTap;

  const SignUpView({
    super.key,
    this.languageSelected,
    this.canPop,
    this.firstNameField,
    this.lastNameField,
    this.emailField,
    this.phoneField,
    this.passwordField,
    this.confirmPassField,
    this.navButton,
    this.onSignInTap,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop!,
      child: Scaffold(
        backgroundColor: Hues.greyLightest,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              style: TopBarStyle.enableBack,
              title: languageSelected == 0
                  ? "Buat akun baru"
                  : "Create new account",
              onBackTap: () {},
            ),
            Container(
              height: 1.sh - (ScreenUtil().statusBarHeight + kToolbarHeight),
              padding: EdgeInsets.symmetric(horizontal: 48.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  firstNameField!,
                  SizedBox(height: 12.h),
                  lastNameField!,
                  SizedBox(height: 12.h),
                  emailField!,
                  SizedBox(height: 12.h),
                  phoneField!,
                  SizedBox(height: 12.h),
                  passwordField!,
                  SizedBox(height: 12.h),
                  confirmPassField!,
                  //
                  //
                  const Expanded(child: SizedBox()),
                  navButton!,
                  SizedBox(height: 12.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: languageSelected == 0
                          ? "Sudah mempunyai akun? "
                          : "Already have an account? ",
                      style: Fonts.regular(),
                      children: [
                        TextSpan(
                          text: languageSelected == 0 ? " Masuk" : " Sign in",
                          style: Fonts.semiBold(
                            color: Hues.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = onSignInTap,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 48.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
