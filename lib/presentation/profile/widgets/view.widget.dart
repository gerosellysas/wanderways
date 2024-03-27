import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class ProfileView extends StatelessWidget {
  final int? languageSelected;
  final Widget? user;
  final Widget? settings;
  final Widget? deleteButton;

  const ProfileView({
    super.key,
    this.languageSelected,
    this.user,
    this.settings,
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    user!,
                    settings!,
                    SizedBox(height: 12.h),
                    deleteButton!,
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ),
          TopBar(
            title: languageSelected == 0 ? "Profil" : "Profile",
            style: TopBarStyle.title,
          ),
        ],
      ),
    );
  }
}
