import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/features/network/domain/network.domain.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class BookingStatusDetail extends StatelessWidget {
  final int? languageSelected;
  final String? locale;
  final Purchase? purchase;
  final List<Trip>? trips;
  final void Function()? onPayTap;
  final void Function()? onCancelTap;

  const BookingStatusDetail({
    super.key,
    this.languageSelected,
    this.locale,
    this.purchase,
    this.trips,
    this.onPayTap,
    this.onCancelTap,
  });

  double get _defaultWidth => 1.sw - 48.w;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        _BookingStatusDetailPrice(
          key: key,
          width: _defaultWidth,
          languageSelected: languageSelected,
          locale: locale,
          purchase: purchase,
        ),
        purchase!.paymentStatus == "paid"
            ? _BookingStatusDetailTicket(
                key: key,
                depart: true,
                width: _defaultWidth,
                languageSelected: languageSelected,
                ticketId: purchase!.departureTicketId!,
                route: "${trips![0].destination} - ${trips![0].origin}",
                date: purchase!.departureDate,
                tripTimes: "${trips![0].departure} - ${trips![0].arrival}",
                passenger: purchase!.passenger,
                seats: purchase!.departureSeats,
              )
            : const SizedBox(),
        purchase!.paymentStatus == "paid" && purchase!.roundTrip == 1
            ? _BookingStatusDetailTicket(
                key: key,
                depart: false,
                width: _defaultWidth,
                languageSelected: languageSelected,
                ticketId: purchase!.returnTicketId!,
                route: "${trips![1].origin} - ${trips![1].destination}",
                date: purchase!.returnDate,
                tripTimes: "${trips![1].departure} - ${trips![1].arrival}",
                passenger: purchase!.passenger,
                seats: purchase!.returnSeats,
              )
            : const SizedBox(),
        const Expanded(child: SizedBox()),
        _BookingStatusButton(
          key: key,
          languageSelected: languageSelected,
          status: purchase!.paymentStatus,
          onPayTap: onPayTap,
          onCancelTap: onCancelTap,
        ),
      ],
    );
  }
}

class _BookingStatusDetailPrice extends StatelessWidget {
  final double? width;
  final int? languageSelected;
  final String? locale;
  final Purchase? purchase;

  const _BookingStatusDetailPrice({
    super.key,
    this.width,
    this.languageSelected,
    this.locale,
    this.purchase,
  });

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
    return Container(
      width: width!,
      padding: EdgeInsets.all(12.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (languageSelected == 0 ? "ID Pemesanan : " : "Booking ID : ") +
                purchase!.bookingId!,
            style: Fonts.semiBold(),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            color: Hues.greyLight,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: Fonts.regular(size: 13, color: Hues.greyDarkest),
                    ),
                    Text(
                      "Rp ${_purchasePrice.priceFormatter(locale)}",
                      style: Fonts.semiBold(size: 13),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageSelected == 0 ? "Pajak" : "Tax",
                      style: Fonts.regular(size: 13, color: Hues.greyDarkest),
                    ),
                    Text(
                      "Rp ${_tax.priceFormatter(locale)}",
                      style: Fonts.semiBold(size: 13),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Divider(
                  height: 8.h,
                  color: Hues.greyDarkest,
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageSelected == 0
                          ? "Total pembayaran"
                          : "Total payment",
                      style: Fonts.regular(
                        size: 13,
                        color: Hues.greyDarkest,
                      ),
                    ),
                    Text(
                      "Rp ${_totalPrice.priceFormatter(locale)}",
                      style: Fonts.semiBold(
                        size: 13,
                        color: Hues.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
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
        ],
      ),
    );
  }
}

class _BookingStatusDetailTicket extends StatelessWidget {
  final double? width;
  final bool? depart;
  final int? languageSelected;
  final String? ticketId;
  final String? route;
  final String? date;
  final String? tripTimes;
  final int? passenger;
  final String? seats;

  const _BookingStatusDetailTicket({
    super.key,
    this.depart,
    this.width,
    this.languageSelected,
    this.ticketId,
    this.route,
    this.date,
    this.tripTimes,
    this.passenger,
    this.seats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(top: depart! ? 32.h : 8.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                (languageSelected == 0 ? "Nomor Tiket : " : "Ticket Number : "),
                style: Fonts.regular(color: Hues.greyDarkest, size: 12),
              ),
              Text(
                ticketId!,
                style: Fonts.semiBold(color: Hues.primary, size: 12),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            route!,
            style: Fonts.semiBold(size: 14),
          ),
          Text(
            "$date ($tripTimes)",
            style: Fonts.regular(size: 12, color: Hues.greyDarkest),
          ),
          Text(
            "$passenger${languageSelected == 0 ? " orang" : passenger! > 1 ? " person" : " persons"} - ${languageSelected == 0 ? "Nomor kursi :" : "Seat number :"} $seats",
            style: Fonts.regular(size: 12, color: Hues.greyDarkest),
          ),
        ],
      ),
    );
  }
}

class _BookingStatusButton extends StatelessWidget {
  final int? languageSelected;
  final String? status;
  final void Function()? onPayTap;
  final void Function()? onCancelTap;

  const _BookingStatusButton({
    super.key,
    this.languageSelected,
    this.status,
    this.onPayTap,
    this.onCancelTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        status! == "wait"
            ? NavButton(
                text: languageSelected == 0 ? "Bayar sekarng" : "Pay now",
                onTap: onPayTap,
              )
            : const SizedBox(),
        SizedBox(height: status! == "wait" ? 12.h : 0),
        NavButton(
          text: languageSelected == 0 ? "Batalkan pesanan" : "Cancel booking",
          color: Hues.red,
          splashColor: Colors.red.withOpacity(0.72),
          onTap: onCancelTap,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
