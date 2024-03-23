import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class HomeDatePicker extends StatelessWidget {
  final int? languageSelected;
  final bool? roundTrip;
  final String? locale;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final void Function(DateRangePickerSelectionChangedArgs)? onSelectionChange;
  final void Function()? onAddReturnTap;

  const HomeDatePicker({
    super.key,
    this.languageSelected,
    this.roundTrip,
    this.locale,
    this.departureDate,
    this.returnDate,
    this.onSelectionChange,
    this.onAddReturnTap,
  });

  DateTime get _now => DateTime.now().toLocal();

  double get _headerElevationHeight => 56.h;

  double get _topHeight => ScreenUtil().statusBarHeight + kToolbarHeight + 8.h;

  double get _bottomHeight => 85.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hues.white,
      body: Stack(
        children: [
          _HomeDatePickerHeaderElevation(
            key: key,
            height: _topHeight + _headerElevationHeight,
          ),
          _HomeDatePickerAppBar(
            key: key,
            languageSelected: languageSelected,
          ),
          Column(
            children: [
              SizedBox(height: _topHeight),
              Expanded(
                child: SfDateRangePicker(
                  backgroundColor: Colors.transparent,
                  allowViewNavigation: false,
                  showNavigationArrow: false,
                  enableMultiView: true,
                  enablePastDates: false,
                  initialSelectedRange: PickerDateRange(departureDate, null),
                  navigationMode: DateRangePickerNavigationMode.scroll,
                  navigationDirection:
                      DateRangePickerNavigationDirection.vertical,
                  minDate: _now,
                  maxDate: _now.add(const Duration(days: 45)),
                  headerHeight: _headerElevationHeight / 2,
                  headerStyle: DateRangePickerHeaderStyle(
                    backgroundColor: Hues.white,
                    textStyle: Fonts.semiBold(size: 12),
                  ),
                  monthViewSettings: DateRangePickerMonthViewSettings(
                    enableSwipeSelection: false,
                    dayFormat: "E",
                    firstDayOfWeek: 1,
                    viewHeaderHeight: _headerElevationHeight / 2,
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      backgroundColor: Hues.white,
                      textStyle: Fonts.regular(size: 12),
                    ),
                  ),
                  todayHighlightColor: Hues.primary,
                  startRangeSelectionColor: Hues.primary,
                  endRangeSelectionColor: Hues.primary,
                  rangeSelectionColor: Hues.secondary.withOpacity(0.24),
                  selectionColor: Hues.primary,
                  selectionMode: roundTrip!
                      ? DateRangePickerSelectionMode.range
                      : DateRangePickerSelectionMode.single,
                  onSelectionChanged: onSelectionChange,
                ),
              ),
              SizedBox(height: _bottomHeight),
            ],
          ),
          _HomeDatePickerBottomBar(
            key: key,
            languageSelected: languageSelected!,
            height: _bottomHeight,
            roundTrip: roundTrip,
            departureDate: departureDate?.pickerStringFormat(locale) ?? "",
            returnDate: returnDate?.pickerStringFormat(locale) ?? "",
            onAddReturnTap: onAddReturnTap,
          ),
        ],
      ),
    );
  }
}

/// Home date picker header elevation.
class _HomeDatePickerHeaderElevation extends StatelessWidget {
  final double? height;

  const _HomeDatePickerHeaderElevation({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Hues.white,
      elevation: 6,
      child: SizedBox(
        height: height,
        width: 1.sw,
      ),
    );
  }
}

/// Home date picker app bar.
class _HomeDatePickerAppBar extends StatelessWidget {
  final int? languageSelected;

  const _HomeDatePickerAppBar({
    super.key,
    this.languageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Hues.primary,
      elevation: 4,
      child: SizedBox(
        height: ScreenUtil().statusBarHeight + kToolbarHeight,
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().statusBarHeight),
            Container(
              height: kToolbarHeight,
              alignment: Alignment.center,
              child: Text(
                languageSelected == 0 ? "Pilih Tanggal" : "Select Date",
                style: Fonts.bold(
                  color: Hues.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Home date picker bottom bar.
class _HomeDatePickerBottomBar extends StatelessWidget {
  final int? languageSelected;
  final double? height;
  final bool? roundTrip;
  final String? departureDate;
  final String? returnDate;
  final void Function()? onAddReturnTap;

  const _HomeDatePickerBottomBar({
    super.key,
    this.languageSelected,
    this.height,
    this.roundTrip,
    this.departureDate,
    this.returnDate,
    this.onAddReturnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height,
        width: 1.sw,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: Hues.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -4),
              blurRadius: 4,
              color: Hues.black.withOpacity(0.32),
            ),
          ],
        ),
        child: Column(
          children: [
            _HomeDatePickerSelected(
              key: key,
              languageSelected: languageSelected,
              roundTrip: roundTrip,
              departureDate: departureDate,
              returnDate: returnDate,
              onAddReturnTap: onAddReturnTap,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

/// Home date picker selected date.
class _HomeDatePickerSelected extends StatelessWidget {
  final int? languageSelected;
  final bool? roundTrip;
  final String? departureDate;
  final String? returnDate;
  final void Function()? onAddReturnTap;

  const _HomeDatePickerSelected({
    super.key,
    this.languageSelected,
    this.roundTrip,
    this.departureDate,
    this.returnDate,
    this.onAddReturnTap,
  });

  String _date(String date) => date == ""
      ? languageSelected == 0
          ? "Pilih tanggal"
          : "Choose date"
      : date;

  Widget _selected({
    required CrossAxisAlignment crossAxis,
    required String title,
    required String date,
  }) =>
      Column(
        crossAxisAlignment: crossAxis,
        children: [
          Text(
            title,
            style: Fonts.regular(size: 10),
          ),
          SizedBox(height: 4.h),
          Text(
            _date(date),
            style: Fonts.semiBold(size: 14),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _selected(
            crossAxis: CrossAxisAlignment.start,
            title: languageSelected == 0
                ? "Tanggal keberangkatan"
                : "Departure date",
            date: departureDate!,
          ),
          const Expanded(child: SizedBox()),
          roundTrip!
              ? _selected(
                  crossAxis: CrossAxisAlignment.end,
                  title:
                      languageSelected == 0 ? "Tanggal kembali" : "Return date",
                  date: returnDate!,
                )
              : Material(
                  borderRadius: BorderRadius.circular(8.w),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.w),
                    highlightColor: Hues.secondary.withOpacity(0.16),
                    splashColor: Hues.secondary.withOpacity(0.16),
                    onTap: onAddReturnTap,
                    child: Container(
                      height: 37.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        border: Border.all(
                          color: Hues.primary,
                        ),
                      ),
                      child: Text(
                        languageSelected == 0
                            ? "Tambahkan tanggal kembali"
                            : "Add return date",
                        style: Fonts.semiBold(color: Hues.primary, size: 12),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
