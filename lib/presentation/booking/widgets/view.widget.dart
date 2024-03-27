import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class BookingView extends StatelessWidget {
  final int? languageSelected;
  final bool? loading;
  final bool? empty;
  final Widget? list;

  const BookingView({
    super.key,
    this.languageSelected,
    this.loading,
    this.empty,
    this.list,
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
              child: loading!
                  ? Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Hues.primary,
                        size: 24.w,
                      ),
                    )
                  : empty!
                      ? Text(
                          languageSelected == 0
                              ? "Anda belum melakukan pemesanan perjalanan kemanapun."
                              : "You haven't made any travel booking yet.",
                          textAlign: TextAlign.center,
                          style: Fonts.semiBoldItalic(
                            color: Hues.greyDarkest,
                            size: 14,
                          ),
                        )
                      : list!,
            ),
          ),
          TopBar(
            title: languageSelected == 0 ? "Pemesanan" : "Booking",
            style: TopBarStyle.title,
          ),
        ],
      ),
    );
  }
}
