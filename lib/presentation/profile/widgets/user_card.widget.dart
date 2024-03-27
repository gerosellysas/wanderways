import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class ProfileUserCard extends StatelessWidget {
  final User? user;
  final void Function()? onEditEmailTap;
  final void Function()? onEditPhoneTap;

  const ProfileUserCard({
    super.key,
    this.user,
    this.onEditEmailTap,
    this.onEditPhoneTap,
  });

  double get _defaultWidth => 1.sw - 48.w;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: _defaultWidth,
      margin: EdgeInsets.fromLTRB(24.w, 32.w, 24.w, 12.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Hues.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 2,
            color: Hues.black.withOpacity(0.32),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${user!.firstName} ${user!.lastName}",
            style: Fonts.bold(),
          ),
          const Expanded(child: SizedBox()),
          SizedBox(
            height: 26.h,
            child: Row(
              children: [
                Text(
                  "${user!.email}",
                  style: Fonts.regular(color: Hues.greyDarkest),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: onEditEmailTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      "Edit",
                      style: Fonts.italic(
                        color: Hues.primary,
                        size: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 26.h,
            child: Row(
              children: [
                Text(
                  "${user!.phone}",
                  style: Fonts.regular(color: Hues.greyDarkest),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: onEditPhoneTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      "Edit",
                      style: Fonts.italic(
                        color: Hues.primary,
                        size: 12,
                      ),
                    ),
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
