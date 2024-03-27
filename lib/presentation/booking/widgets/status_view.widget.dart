import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class BookingStatusView extends StatelessWidget {
  final int? languageSelected;
  final String? bookingId;
  final Widget? detail;
  final void Function()? onBackTap;

  const BookingStatusView({
    super.key,
    this.languageSelected,
    this.bookingId,
    this.detail,
    this.onBackTap,
  });

  double get _topHeight => ScreenUtil().statusBarHeight + kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hues.greyLightest,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, _topHeight, 0, 0),
            child: Container(
              height: 1.sh - _topHeight,
              width: 1.sw,
              alignment: Alignment.center,
              child: detail!,
            ),
          ),
          TopBar(
            title:
                languageSelected == 0 ? "Detail Pemesanan" : "Booking Details",
            style: TopBarStyle.enableBack,
            onBackTap: onBackTap,
          ),
        ],
      ),
    );
  }
}
