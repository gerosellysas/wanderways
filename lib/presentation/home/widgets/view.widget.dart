import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

import '../paints/home.paints.dart';
import 'field.widget.dart';
import 'header.widget.dart';
import 'logo.widget.dart';

class HomeView extends StatelessWidget {
  final int? languageSelected;
  final AnimationController? returnFieldAnimation;
  final bool? roundTrip;
  final List<bool>? locationEmpties;
  final Widget? departureLocation;
  final Widget? arrivalLocation;
  final Widget? swapButton;
  final Widget? departureDate;
  final Widget? returnDate;
  final Widget? switchButton;
  final Widget? seat;
  final void Function()? onDepartureDateTap;
  final void Function()? onReturnDateTap;
  final void Function()? onSearchTap;

  const HomeView({
    super.key,
    this.languageSelected,
    this.returnFieldAnimation,
    this.roundTrip,
    this.locationEmpties,
    this.departureLocation,
    this.arrivalLocation,
    this.swapButton,
    this.departureDate,
    this.returnDate,
    this.switchButton,
    this.seat,
    this.onDepartureDateTap,
    this.onReturnDateTap,
    this.onSearchTap,
  });

  Animation<double> get _returnFieldHeight => Tween<double>(
        begin: 0,
        end: 79.h,
      ).animate(
        CurvedAnimation(
          parent: returnFieldAnimation!,
          curve: const Interval(0, 1),
          reverseCurve: const Interval(0, 1),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hues.greyLightest,
      body: Stack(
        children: [
          CustomPaint(
            size: Size(1.sw, 1.sh),
            painter: const HomeViewPaint(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil().statusBarHeight),
                const HomeLogo(),
                HomeHeader(
                  languageSelected: languageSelected,
                ),
                AnimatedBuilder(
                  animation: returnFieldAnimation!,
                  builder: (context, _) {
                    return Container(
                      height: 416.h +
                          (locationEmpties![0] ? 18.h : 0) +
                          (locationEmpties![1] ? 18.h : 0) +
                          _returnFieldHeight.value,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: Hues.white,
                        borderRadius: BorderRadius.circular(16.w),
                        boxShadow: [
                          BoxShadow(
                            color: Hues.black.withOpacity(0.32),
                            offset: Offset(0, 2.h),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HomeField(
                                label: languageSelected == 0 ? "Dari" : "From",
                                icon: Images.van,
                                flip: false,
                                isEmpty: locationEmpties![0],
                                emptyText: languageSelected == 0
                                    ? "Pilih lokasi keberangkatan Anda"
                                    : "Select your departure location",
                                child: departureLocation!,
                              ),
                              HomeField(
                                label: languageSelected == 0 ? "Ke" : "To",
                                icon: Images.van,
                                flip: true,
                                isEmpty: locationEmpties![1],
                                emptyText: languageSelected == 0
                                    ? "Pilih tujuan Anda"
                                    : "Select your destination",
                                child: arrivalLocation!,
                              ),
                              HomeField(
                                label: languageSelected == 0
                                    ? "Tanggal Berangkat"
                                    : "Departure Date",
                                icon: Images.calendar,
                                flip: false,
                                onTap: onDepartureDateTap,
                                child: departureDate!,
                              ),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 150),
                                reverseDuration:
                                    const Duration(milliseconds: 150),
                                child: SizedBox(
                                  height: roundTrip! ? 79.h : 0,
                                  child: HomeField(
                                    label: languageSelected == 0
                                        ? "Tanggal Kembali"
                                        : "Return Date",
                                    fieldHeight: roundTrip! ? 46.h : 0,
                                    icon: Images.calendar,
                                    flip: false,
                                    onTap: onReturnDateTap,
                                    child: returnDate!,
                                  ),
                                ),
                              ),
                              HomeField(
                                label: languageSelected == 0
                                    ? "Jumlah Kursi"
                                    : "Seat",
                                icon: Images.seat,
                                flip: false,
                                isEmpty: true,
                                emptyColor: Hues.greyDarkest,
                                emptyText: languageSelected == 0
                                    ? "Anak 2 tahun ke atas wajib beli tiket"
                                    : "Children above 2 years old must buy tickets",
                                child: seat!,
                              ),
                              SizedBox(height: 18.h),
                              NavButton(
                                text: languageSelected == 0 ? "Cari" : "Search",
                                onTap: onSearchTap,
                              ),
                            ],
                          ),
                          swapButton!,
                          switchButton!,
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
