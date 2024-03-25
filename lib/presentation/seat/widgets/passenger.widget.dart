import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class SeatPassenger extends StatelessWidget {
  final int? languageSelected;
  final List<String>? route;
  final String? date;
  final int? passenger;
  final List<int>? seatsNo;
  final List<bool>? activesPass;
  final void Function(int)? onTap;

  const SeatPassenger({
    super.key,
    this.languageSelected,
    this.date,
    this.route,
    this.passenger,
    this.seatsNo,
    this.activesPass,
    this.onTap,
  });

  List<Widget> get _cards => List.generate(
        passenger!,
        (index) => _SeatPassengerCard(
          key: key,
          languageSelected: languageSelected,
          passenger: index + 1,
          seat: seatsNo?[index] ?? -1,
          active: activesPass![index],
          onTap: () => onTap!(index),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20.h,
          alignment: Alignment.topCenter,
          child: Text(
            "${route![0]} - ${route![1]} (${date!})",
            style: Fonts.semiBold(),
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: passenger! == 2
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: passenger! == 2
              ? [
                  _cards[0],
                  SizedBox(width: 8.w),
                  _cards[1],
                ]
              : _cards,
        ),
      ],
    );
  }
}

class _SeatPassengerCard extends StatelessWidget {
  final int? languageSelected;
  final int? passenger;
  final int? seat;
  final bool? active;
  final void Function()? onTap;

  const _SeatPassengerCard({
    super.key,
    this.languageSelected,
    this.passenger,
    this.seat,
    this.active,
    this.onTap,
  });

  double get _height => 56.h;

  double get _width => (1.sw - 36.w) / 3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color:
              active! ? Hues.secondary.withOpacity(0.48) : Colors.transparent,
          borderRadius: BorderRadius.circular(4.w),
          border: Border.all(
            color: active!
                ? Hues.primary
                : seat != -1
                    ? Hues.black
                    : Hues.greyDarkest,
            width: active! ? 1.5 : 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              languageSelected == 0
                  ? "Penumpang $passenger"
                  : "Passenger $passenger",
              style: Fonts.medium(size: 13),
            ),
            Text(
              languageSelected == 0
                  ? seat == -1
                      ? "Belum memilih"
                      : "Kursi $seat"
                  : seat == -1
                      ? "No preference"
                      : "Seat $seat",
              style: Fonts.regular(
                color: seat == -1 ? Hues.greyDarkest : Hues.primary,
                size: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
