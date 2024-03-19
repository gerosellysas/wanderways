import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

import 'icon_press_button.widget.dart';

class TopBar extends StatelessWidget {
  final String? title;
  final TopBarStyle? style;
  final void Function()? onBackTap;

  const TopBar({
    super.key,
    this.title,
    this.style = TopBarStyle.enableBack,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Hues.greyLightest,
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight),
          Container(
            height: kToolbarHeight,
            width: 1.sw,
            padding: EdgeInsets.only(
              left: style == TopBarStyle.enableBack ? 0 : 16.w,
              right: 16.w,
            ),
            alignment: Alignment.center,
            child: style == TopBarStyle.enableBack
                ? Row(
                    children: [
                      IconPressButton(
                        icon: Images.arrow,
                        onTap: onBackTap,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        title!,
                        style: Fonts.bold(
                          size: 16,
                        ),
                      ),
                    ],
                  )
                : Text(
                    title!,
                    style: Fonts.bold(
                      size: 16,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
