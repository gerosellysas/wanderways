import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class PaymentView extends StatelessWidget {
  final int? languageSelected;
  final Widget? detail;
  final void Function()? onBackTap;

  const PaymentView({
    super.key,
    this.languageSelected,
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
              child: Column(
                children: [
                  detail!,
                ],
              ),
            ),
          ),
          TopBar(
            title: languageSelected == 0 ? "Pembayaran" : "Payment",
            style: TopBarStyle.enableBack,
            onBackTap: onBackTap,
          ),
        ],
      ),
    );
  }
}
