import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class SignUpOverlaySuccess extends StatelessWidget {
  final int? languageSelected;
  final void Function()? onSignInTap;

  const SignUpOverlaySuccess({
    super.key,
    this.languageSelected,
    this.onSignInTap,
  });

  double get _size => 140.w;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: Hues.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                SizedBox(height: 120.h),
                SizedBox(
                  height: _size,
                  width: _size,
                  child: SvgPicture.asset(
                    Images.success,
                    fit: BoxFit.contain,
                    height: _size,
                    width: _size,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  languageSelected == 0 ? "Selamat !!!" : "Congraculation !!!",
                  textAlign: TextAlign.center,
                  style: Fonts.bold(
                    size: 20,
                  ),
                ),
                SizedBox(height: 48.h),
                Text(
                  languageSelected == 0
                      ? "Akun Anda telah berhasil dibuat"
                      : "Your account has been cretaed successfully",
                  textAlign: TextAlign.center,
                  style: Fonts.regular(
                    size: 16,
                  ),
                ),
                SizedBox(height: 24.w),
                Text(
                  languageSelected == 0
                      ? "Sekarang anda dapat masuk ke dalam aplikasi Wander Ways menggunakan akun yang sudah anda buat."
                      : "Now you can sign in to Wander Ways using the account you have created.",
                  textAlign: TextAlign.center,
                  style: Fonts.regular(
                    size: 16,
                  ),
                ),
                SizedBox(height: 32.w),
                GestureDetector(
                  onTap: onSignInTap,
                  child: Container(
                    height: 40,
                    width: 180,
                    alignment: Alignment.center,
                    child: Text(
                      languageSelected == 0
                          ? "Ke halaman masuk"
                          : "Go to sign in page",
                      textAlign: TextAlign.center,
                      style: Fonts.semiBold(
                        color: Hues.primary,
                        size: 16,
                      ).copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Hues.primary,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
