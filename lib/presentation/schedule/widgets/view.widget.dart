import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class ScheduleView extends StatelessWidget {
  final int? languageSelected;
  final bool? loading;
  final bool? listEmpty;
  final List<String?>? route;
  final Widget? detail;
  final Widget? list;
  final void Function()? onBackTap;
  final void Function()? onReloadTap;

  const ScheduleView({
    super.key,
    this.languageSelected,
    this.loading,
    this.listEmpty,
    this.route,
    this.detail,
    this.list,
    this.onBackTap,
    this.onReloadTap,
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
                  : listEmpty!
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                languageSelected == 0
                                    ? "Terjadi kesalahan saat memuat jadwal perjalanan!"
                                    : "An error occurred while loading the trip schedule!",
                                textAlign: TextAlign.center,
                                style: Fonts.semiBoldItalic(size: 14),
                              ),
                              SizedBox(height: 12.h),
                              NavButton(
                                w: 160.w,
                                text: languageSelected == 0
                                    ? "Muat ulang"
                                    : "Reload",
                                onTap: onReloadTap,
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Material(
                              color: Hues.white,
                              elevation: 6,
                              child: Container(
                                height: 52.h,
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                alignment: Alignment.center,
                                child: detail!,
                              ),
                            ),
                            list!,
                          ],
                        ),
            ),
          ),
          TopBar(
            title: "${route?[0]} - ${route?[1]}",
            style: TopBarStyle.enableBack,
            onBackTap: onBackTap,
          ),
        ],
      ),
    );
  }
}
