import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class ScheduleCard extends StatelessWidget {
  final int? languageSelected;
  final String? origin;
  final String? destination;
  final String? departure;
  final String? arrival;
  final String? locale;
  final int? price;
  final List<String>? seats;
  final void Function()? onTap;

  const ScheduleCard({
    super.key,
    this.languageSelected,
    this.origin,
    this.destination,
    this.departure,
    this.arrival,
    this.locale,
    this.price,
    this.seats,
    this.onTap,
  });

  double get _defaultWidth => (1.sw - 80.w) / 2;

  double get _defaultHeight => 20.h;

  double get _timeWidth => 60.w;

  bool get _seatAvailable => seats!.checkTripSeatAvailability;

  int get _seatNumber => seats!.checkTripSeatNumber;

  String get _price => price!.priceFormatter(locale);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Card(
        color: Hues.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.w),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // first row
              Column(
                children: [
                  Container(
                    height: _defaultHeight,
                    width: _defaultWidth,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _timeWidth,
                          alignment: Alignment.center,
                          child: Text(
                            departure!,
                            style: Fonts.regular(size: 14),
                          ),
                        ),
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Hues.primary),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          origin!,
                          style: Fonts.regular(size: 14),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _defaultHeight * 2,
                    width: _defaultWidth,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _timeWidth,
                          alignment: Alignment.center,
                          child: Text(
                            "${departure!}-${arrival!}"
                                .claculateTripLength(locale),
                            style: Fonts.regular(
                                color: Hues.greyDarkest, size: 10),
                          ),
                        ),
                        SizedBox(
                          height: _defaultHeight * 2,
                          child: VerticalDivider(
                            width: 10.w,
                            color: Hues.secondary,
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _defaultHeight,
                    width: _defaultWidth,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _timeWidth,
                          alignment: Alignment.center,
                          child: Text(
                            arrival!,
                            style: Fonts.regular(size: 14),
                          ),
                        ),
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Hues.primary,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          destination!,
                          style: Fonts.regular(size: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: _defaultHeight * 4,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      languageSelected == 0
                          ? "Rp $_price/kursi"
                          : "Rp $_price/seat",
                      style: Fonts.bold(color: Hues.primary, size: 14),
                    ),
                    Text(
                      languageSelected == 0
                          ? _seatAvailable
                              ? "Tersedia $_seatNumber kursi"
                              : "Habis"
                          : _seatAvailable
                              ? "$_seatNumber seats available"
                              : "Sold out",
                      style: Fonts.regular(
                        color: _seatAvailable ? Hues.black : Hues.red,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
