import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class SeatSelector extends StatelessWidget {
  final int? languageSelected;
  final List<String>? seats;
  final List<int>? seatsNo;
  final List<bool>? activesPass;
  final void Function(int)? onSelect;

  const SeatSelector({
    super.key,
    this.languageSelected,
    this.seats,
    this.seatsNo,
    this.activesPass,
    this.onSelect,
  });

  double get _detailSize => 24.w;

  List<Widget> get _details {
    var detailsID = ["Terisi", "Tersedia", "Dipilih"];
    var detailsEN = ["Booked", "Available", "Chosen"];
    var detailsColor = [Hues.greyDark, Hues.white, Hues.primary];
    return List.generate(
      3,
      (index) => Row(
        children: [
          Container(
            height: _detailSize,
            width: _detailSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.w),
              color: detailsColor[index],
              border: index == 1 ? Border.all(color: Hues.primary) : null,
            ),
          ),
          SizedBox(width: 8.h),
          Text(
            languageSelected == 0 ? detailsID[index] : detailsEN[index],
            style: Fonts.regular(size: 12),
          )
        ],
      ),
    );
  }

  List<Widget> _seatsSelector([bool? template = false, String? indicator]) {
    var available = seats!.map((s) => s == "available").toList();
    var activeIndex = activesPass!.indexWhere((a) => a == true);
    return List.generate(seats!.length, (index) {
      var seatActive = activeIndex != -1 && seatsNo![activeIndex] - 1 == index;
      var seatP1 = activesPass!.length <= 3 && seatsNo![0] - 1 == index;
      var seatP2 = (activesPass!.length >= 2 && activesPass!.length <= 3) &&
          seatsNo![1] - 1 == index;
      var seatP3 = activesPass!.length == 3 && seatsNo![2] - 1 == index;
      var selected = seatActive || seatP1 || seatP2 || seatP3;
      return GestureDetector(
        onTap: template == true
            ? () => onSelect!(index)
            : !available[index] || selected
                ? null
                : () => onSelect!(index),
        child: Container(
          height: _detailSize * 1.5,
          width: _detailSize * 1.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: selected
                ? Hues.primary
                : available[index]
                    ? Hues.white
                    : Hues.greyDark,
            border: selected || !available[index]
                ? null
                : Border.all(color: Hues.primary),
          ),
          child: Text(
            seatP1
                ? "P1"
                : seatP2
                    ? "P2"
                    : seatP3
                        ? "P3"
                        : indicator != null && seatActive
                            ? indicator
                            : available[index]
                                ? "${index + 1}"
                                : "X",
            style: Fonts.regular(
              color: selected
                  ? Hues.white
                  : available[index]
                      ? Hues.primary
                      : Hues.greyDarkest,
            ),
          ),
        ),
      );
    });
  }

  Widget _selectorRow_1({bool? template = false, String? indicator}) => Row(
        children: [
          _seatsSelector(template, indicator)[0],
          SizedBox(width: 8.w),
          SizedBox(width: _detailSize * 1.5),
          SizedBox(width: 8.w),
          Container(
            height: _detailSize * 1.5,
            width: _detailSize * 1.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Hues.greyLightest,
              borderRadius: BorderRadius.circular(4.w),
              border: Border.all(color: Hues.greyDarkest),
            ),
            child: SvgPicture.asset(
              Images.driver,
              fit: BoxFit.contain,
              height: _detailSize,
              width: _detailSize,
            ),
          ),
        ],
      );

  Widget _selectorRow_2({bool? template = false, String? indicator}) => Row(
        children: [
          SizedBox(width: _detailSize * 1.5),
          SizedBox(width: 8.w),
          _seatsSelector(template, indicator)[1],
          SizedBox(width: 8.w),
          _seatsSelector(template, indicator)[2],
        ],
      );

  Widget _selectorRow_3({bool? template = false, String? indicator}) => Row(
        children: [
          _seatsSelector(template, indicator)[3],
          SizedBox(width: 8.w),
          SizedBox(width: _detailSize * 1.5),
          SizedBox(width: 8.w),
          _seatsSelector(template, indicator)[4],
        ],
      );

  Widget _selectorRow_4({bool? template = false, String? indicator}) => Row(
        children: [
          _seatsSelector(template, indicator)[5],
          SizedBox(width: 8.w),
          _seatsSelector(template, indicator)[6],
          SizedBox(width: 8.w),
          _seatsSelector(template, indicator)[7],
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 48.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _details,
            ),
          ),
          SizedBox(height: 48.h),
          Container(
            height: 204.w,
            width: 148.w,
            padding: EdgeInsets.all(12.w),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _selectorRow_1(template: true),
                    SizedBox(height: 8.w),
                    Divider(color: Hues.greyDark, height: 4.w),
                    SizedBox(height: 8.w),
                    _selectorRow_2(template: true),
                    SizedBox(height: 8.w),
                    _selectorRow_3(template: true),
                    SizedBox(height: 8.w),
                    _selectorRow_4(template: true),
                  ],
                ),
                Visibility(
                  visible: activesPass!.length <= 3 && activesPass![0] == true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _selectorRow_1(indicator: "P1"),
                      SizedBox(height: 8.w),
                      Divider(color: Hues.greyDark, height: 4.w),
                      SizedBox(height: 8.w),
                      _selectorRow_2(indicator: "P1"),
                      SizedBox(height: 8.w),
                      _selectorRow_3(indicator: "P1"),
                      SizedBox(height: 8.w),
                      _selectorRow_4(indicator: "P1"),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                      (activesPass!.length >= 2 && activesPass!.length <= 3) &&
                          activesPass![1] == true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _selectorRow_1(indicator: "P2"),
                      SizedBox(height: 8.w),
                      Divider(color: Hues.greyDark, height: 4.w),
                      SizedBox(height: 8.w),
                      _selectorRow_2(indicator: "P2"),
                      SizedBox(height: 8.w),
                      _selectorRow_3(indicator: "P2"),
                      SizedBox(height: 8.w),
                      _selectorRow_4(indicator: "P2"),
                    ],
                  ),
                ),
                Visibility(
                  visible: activesPass!.length == 3 && activesPass![2] == true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _selectorRow_1(indicator: "P3"),
                      SizedBox(height: 8.w),
                      Divider(color: Hues.greyDark, height: 4.w),
                      SizedBox(height: 8.w),
                      _selectorRow_2(indicator: "P3"),
                      SizedBox(height: 8.w),
                      _selectorRow_3(indicator: "P3"),
                      SizedBox(height: 8.w),
                      _selectorRow_4(indicator: "P3"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
