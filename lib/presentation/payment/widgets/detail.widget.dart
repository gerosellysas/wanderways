import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class PaymentDetail extends StatelessWidget {
  final int? languageSelected;
  final String? locale;
  final User? user;
  final bool? roundTrip;
  final String? bookingID;
  final List<String>? route;
  final List<String>? dates;
  final List<String>? schedule;
  final String? passenger;
  final List<List<int>>? seats;
  final List<int>? prices;
  final bool? paid;
  final void Function(bool?)? onPaidChange;

  const PaymentDetail({
    super.key,
    this.languageSelected,
    this.locale,
    this.user,
    this.roundTrip,
    this.bookingID,
    this.route,
    this.dates,
    this.schedule,
    this.passenger,
    this.seats,
    this.prices,
    this.paid,
    this.onPaidChange,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PaymentUser(
                key: key,
                languageSelected: languageSelected,
                user: user,
                bookingID: bookingID,
                roundTrip: roundTrip,
              ),
              SizedBox(height: 24.h),
              _PaymentTrip(
                key: key,
                languageSelected: languageSelected,
                roundTrip: roundTrip,
                route: route,
                dates: dates,
                schedule: schedule,
                passenger: passenger,
                seats: seats,
              ),
              SizedBox(height: 8.h),
              _PaymentSummary(
                key: key,
                languageSelected: languageSelected,
                locale: locale,
                passenger: int.parse(passenger!),
                prices: prices,
              ),
              SizedBox(height: 8.h),
              Divider(
                height: 8.h,
                color: Hues.greyDark,
              ),
              SizedBox(height: 48.h),
              Center(
                child: NavButton(
                  text: languageSelected == 0
                      ? "Konfirmasi pembayaran"
                      : "Confirm payment",
                  w: double.maxFinite,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: Checkbox(
                      splashRadius: 0,
                      activeColor: Hues.primary,
                      checkColor: Hues.white,
                      side: const BorderSide(
                        width: 1.5,
                        color: Hues.greyDarkest,
                      ),
                      value: paid,
                      onChanged: onPaidChange,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    width: 1.sw - 84.w,
                    padding: EdgeInsets.only(top: 2.h),
                    child: Text(
                      languageSelected == 0
                          ? "Aktifkan kotak centang ini untuk mengubah status pembayaran pesanan ini menjadi sudah dibayar."
                          : "Enable this check box to change the payment status of this booking to paid.",
                      style: Fonts.regular(size: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentUser extends StatelessWidget {
  final int? languageSelected;
  final User? user;
  final String? bookingID;
  final bool? roundTrip;

  const _PaymentUser({
    super.key,
    this.languageSelected,
    this.user,
    this.bookingID,
    this.roundTrip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Hues.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 2,
            color: Hues.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 41.25.h,
              width: 52.5.w,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Images.logo,
                fit: BoxFit.contain,
                height: 41.25.h,
                width: 52.5.w,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${languageSelected == 0 ? "Selamat" : "Congratulation"} ${user!.firstName} ${user!.lastName}!",
                style: Fonts.bold(),
              ),
              Text(
                languageSelected == 0
                    ? "Tiket Anda berhasil dipesan."
                    : roundTrip!
                        ? "Your tickets are successfully booked."
                        : "Your ticket is successfully booked.",
                style: Fonts.regular(color: Hues.greyDarkest, size: 12),
              ),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  Text(
                    "Booking ID : ",
                    style: Fonts.regular(),
                  ),
                  Text(
                    "$bookingID",
                    style: Fonts.semiBold(color: Hues.primary),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentTrip extends StatelessWidget {
  final int? languageSelected;
  final bool? roundTrip;
  final List<String>? route;
  final List<String>? dates;
  final List<String>? schedule;
  final String? passenger;
  final List<List<int>>? seats;

  const _PaymentTrip({
    super.key,
    this.languageSelected,
    this.roundTrip,
    this.route,
    this.dates,
    this.schedule,
    this.passenger,
    this.seats,
  });

  Widget _detailCrad({
    required String labelID,
    required String labelEN,
    required String value,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 12.h),
              Text("\u{2022}", style: Fonts.semiBold(size: 16)),
              SizedBox(width: 8.h),
              Text(
                languageSelected == 0 ? labelID : labelEN,
                style: Fonts.regular(),
              ),
              Text(
                value,
                style: Fonts.semiBold(color: Hues.primary),
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      );

  String _seatNumber(List<int>? s) {
    switch (s!.length) {
      case 3:
        return "${s[0].toString()} - ${s[1].toString()} - ${s[2].toString()}";
      case 2:
        return "${s[0].toString()} - ${s[1].toString()}";
      default:
        return s[0].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 8.h,
          color: Hues.greyDark,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            languageSelected == 0 ? "Detil Pemesanan" : "Booking Details",
            style: Fonts.bold(),
          ),
        ),
        Divider(
          height: 8.h,
          color: Hues.greyDark,
        ),
        Visibility(
          visible: !roundTrip!,
          child: SizedBox(height: 8.h),
        ),
        Visibility(
          visible: roundTrip!,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              languageSelected == 0 ? "Keberangkatan :" : "Departure :",
              style: Fonts.semiBold(),
            ),
          ),
        ),
        _detailCrad(
          labelID: "Rute : ",
          labelEN: "Route : ",
          value: "${route![0]} - ${route![1]}",
        ),
        _detailCrad(
          labelID: "Tanggal : ",
          labelEN: "Date : ",
          value: dates![0],
        ),
        _detailCrad(
          labelID: "Keberangkatan : ",
          labelEN: "Departure : ",
          value: schedule![0],
        ),
        _detailCrad(
          labelID: "Kedatangan : ",
          labelEN: "Arrival : ",
          value: schedule![1],
        ),
        _detailCrad(
          labelID: "Penumpang : ",
          labelEN: "Passenger : ",
          value: passenger! +
              (languageSelected == 0
                  ? " orang"
                  : int.parse(passenger!) > 1
                      ? " persons"
                      : " person"),
        ),
        _detailCrad(
          labelID: "Kursi : ",
          labelEN: "Seat(s) : ",
          value: _seatNumber(seats![0]),
        ),
        Visibility(
          visible: roundTrip!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  languageSelected == 0
                      ? "Perjalanan Kembali :"
                      : "Return Trtip :",
                  style: Fonts.semiBold(),
                ),
              ),
              _detailCrad(
                labelID: "Rute : ",
                labelEN: "Route : ",
                value: "${route![1]} - ${route![0]}",
              ),
              _detailCrad(
                labelID: "Tanggal : ",
                labelEN: "Date : ",
                value: dates![1],
              ),
              _detailCrad(
                labelID: "Keberangkatan : ",
                labelEN: "Departure : ",
                value: schedule![2],
              ),
              _detailCrad(
                labelID: "Kedatangan : ",
                labelEN: "Arrival : ",
                value: schedule![3],
              ),
              _detailCrad(
                labelID: "Penumpang : ",
                labelEN: "Passenger : ",
                value: passenger! +
                    (languageSelected == 0
                        ? " orang"
                        : int.parse(passenger!) > 1
                            ? " persons"
                            : " person"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  final int? languageSelected;
  final String? locale;
  final int? passenger;
  final List<int>? prices;

  const _PaymentSummary({
    super.key,
    this.languageSelected,
    this.locale,
    this.passenger,
    this.prices,
  });

  int get _price => (passenger! * prices![0]) + (passenger! * prices![1]);

  String get _subTotal => _price.priceFormatter(locale);

  int get _calculateTax => _price.calculateTax();

  String get _tax => _calculateTax.priceFormatter(locale);

  String get _total => (_price + _calculateTax).priceFormatter(locale);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 8.h,
          color: Hues.greyDark,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            languageSelected == 0 ? "Ringkasan Pembayaran" : "Payment Summary",
            style: Fonts.bold(),
          ),
        ),
        Divider(
          height: 8.h,
          color: Hues.greyDark,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 12.h),
            Text("\u{2022}", style: Fonts.semiBold(size: 16)),
            SizedBox(width: 8.h),
            Text(
              "Subtotal",
              style: Fonts.regular(),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "Rp $_subTotal",
              style: Fonts.regular(),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 12.h),
            Text("\u{2022}", style: Fonts.semiBold(size: 16)),
            SizedBox(width: 8.h),
            Text(
              languageSelected == 0 ? "Pajak" : "Tax",
              style: Fonts.regular(),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "Rp $_tax",
              style: Fonts.regular(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.w, 4.h, 0, 4.h),
          child: Divider(
            height: 8.h,
            color: Hues.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 28.h),
            Text(
              languageSelected == 0 ? "Total pembayaran" : "Total payment",
              style: Fonts.semiBold(),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "Rp $_total",
              style: Fonts.semiBold(color: Hues.primary),
            ),
          ],
        ),
      ],
    );
  }
}
