import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class ProfileUserView extends StatelessWidget {
  final int? languageSelected;
  final bool? isEmail;
  final Widget? emailField;
  final Widget? phoneField;
  final Widget? updateButton;
  final Widget? deleteButton;

  const ProfileUserView({
    super.key,
    this.languageSelected,
    this.isEmail,
    this.emailField,
    this.phoneField,
    this.updateButton,
    this.deleteButton,
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
                  SizedBox(height: 24.h),
                  isEmail! ? emailField! : phoneField!,
                  const Expanded(child: SizedBox()),
                  updateButton!,
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
          TopBar(
            title: isEmail!
                ? "Edit Email"
                : languageSelected == 0
                    ? "Edit Nomor Telepon"
                    : "Edit Phone Number",
            style: TopBarStyle.title,
          ),
        ],
      ),
    );
  }
}
