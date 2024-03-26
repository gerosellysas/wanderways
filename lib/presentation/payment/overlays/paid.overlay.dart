import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class PaymentPaid extends StatelessWidget {
  final int? languageSelected;
  final bool? roundTrip;
  final void Function(bool)? onPop;
  final void Function()? onViewTicketTap;

  const PaymentPaid({
    super.key,
    this.languageSelected,
    this.roundTrip,
    this.onPop,
    this.onViewTicketTap,
  });

  double get _size => 140.w;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: onPop,
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
                  languageSelected == 0
                      ? "Pembayaran Berhasil !!!"
                      : "Payment Success !!!",
                  textAlign: TextAlign.center,
                  style: Fonts.bold(
                    size: 20,
                  ),
                ),
                SizedBox(height: 48.h),
                Text(
                  languageSelected == 0
                      ? "Terima kasih atas pembelian Anda"
                      : "Thank you for your purchase",
                  textAlign: TextAlign.center,
                  style: Fonts.regular(
                    size: 16,
                  ),
                ),
                SizedBox(height: 24.w),
                Text(
                  languageSelected == 0
                      ? "Bersiaplah untuk melakukan perjalanan, tiket Anda telah dikonfirmasi."
                      : roundTrip!
                          ? "Get ready to travel, your tickets have been confirmed."
                          : "Get ready to travel, your ticket has been confirmed.",
                  textAlign: TextAlign.center,
                  style: Fonts.regular(
                    size: 16,
                  ),
                ),
                SizedBox(height: 32.w),
                GestureDetector(
                  onTap: onViewTicketTap,
                  child: Container(
                    height: 40,
                    width: 180,
                    alignment: Alignment.center,
                    child: Text(
                      languageSelected == 0
                          ? "Lihat detail tiket"
                          : "View ticket details",
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
