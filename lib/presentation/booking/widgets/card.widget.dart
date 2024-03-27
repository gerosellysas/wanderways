import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/features/network/domain/network.domain.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class BookingCard extends StatelessWidget {
  final int? languageSelected;
  final String? locale;
  final Purchase? purchase;
  final Trip? departureTrip;
  final Trip? returnTrip;
  final void Function()? onDeleteTap;
  final void Function()? onTap;

  const BookingCard({
    super.key,
    this.languageSelected,
    this.locale,
    this.purchase,
    this.departureTrip,
    this.returnTrip,
    this.onDeleteTap,
    this.onTap,
  });

  double get _defaultWidth => 1.sw - 48.w;

  String get _paymentStatusString {
    switch (purchase!.paymentStatus!) {
      case "paid":
        return languageSelected == 0
            ? "Pembelian berhasil"
            : "Purchase succesful";
      case "wait":
        return languageSelected == 0
            ? "Menunggu pembayaran"
            : "Waiting for payment";
      case "cancel":
        return languageSelected == 0
            ? "Pembelian dibatalkan"
            : "Purchase cancelled";
      default:
        return "";
    }
  }

  Color get _paymentStatusColor {
    switch (purchase!.paymentStatus!) {
      case "paid":
        return Hues.primary;
      case "wait":
        return Hues.accent;
      case "cancel":
        return Hues.red;
      default:
        return Hues.black;
    }
  }

  int get _totalDeparturePrice =>
      purchase!.departurePrice! + (purchase!.departurePrice! * 0.1).toInt();

  int get _totalReturnPrice => purchase!.roundTrip == 1
      ? purchase!.returnPrice! + (purchase!.returnPrice! * 0.1).toInt()
      : 0;

  int get _purchasePrice => _totalDeparturePrice + _totalReturnPrice;

  int get _tax => (_purchasePrice * 0.1).toInt();

  int get _totalPrice => _purchasePrice + _tax;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: _defaultWidth,
        decoration: BoxDecoration(
          color: Hues.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 2,
              color: Hues.black.withOpacity(0.32),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 30.h,
                  width: _defaultWidth,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (languageSelected == 0
                                ? "ID Pemesanan : "
                                : "Booking ID : ") +
                            purchase!.bookingId!,
                        style: Fonts.regular(size: 11.5),
                      ),
                      GestureDetector(
                        onTap: onDeleteTap,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Text(
                            languageSelected == 0 ? "Hapus" : "Delete",
                            style: Fonts.regular(
                              color: Hues.red,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.h,
                  width: _defaultWidth,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  color: Hues.greyLight,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        height: 24.w,
                        width: 24.w,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          Images.van,
                          fit: BoxFit.contain,
                          height: 24.w,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        "${departureTrip!.origin} - ${departureTrip!.destination}",
                        style: Fonts.semiBold(size: 14),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: purchase!.roundTrip == 1,
                  child: Column(
                    children: [
                      Container(
                        width: _defaultWidth,
                        color: Hues.greyLight,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Divider(
                          height: 1.5.h,
                          color: Hues.greyDark,
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: _defaultWidth,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        color: Hues.greyLight,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              height: 24.w,
                              width: 24.w,
                              alignment: Alignment.center,
                              child: Transform.flip(
                                flipX: true,
                                child: SvgPicture.asset(
                                  Images.van,
                                  fit: BoxFit.contain,
                                  height: 24.w,
                                  width: 24.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "${returnTrip!.origin} - ${returnTrip!.destination}",
                              style: Fonts.semiBold(size: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.h,
                  width: _defaultWidth,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: _paymentStatusColor,
                          borderRadius: BorderRadius.circular(40.h),
                        ),
                        child: Text(
                          _paymentStatusString,
                          style: Fonts.semiBold(
                            color: Hues.white,
                            size: 12,
                          ),
                        ),
                      ),
                      Text(
                        "Rp ${_totalPrice.priceFormatter(locale)}",
                        style: Fonts.semiBold(size: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
