import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class IconPressButton extends StatelessWidget {
  final String? icon;
  final double? size;
  final Color? color;
  final void Function()? onTap;

  const IconPressButton({
    super.key,
    this.icon,
    this.size,
    this.color,
    this.onTap,
  });

  double get _size => size ?? 48.w;

  double get _radius => _size / 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(_radius),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(_radius),
            highlightColor: Hues.secondary.withOpacity(0.16),
            splashColor: Hues.secondary.withOpacity(0.16),
            onTap: onTap,
            child: Container(
              height: _size,
              width: _size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius),
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            height: _radius,
            width: _radius,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon!,
              fit: BoxFit.fill,
              colorFilter: color != null
                  ? ColorFilter.mode(
                      color!,
                      BlendMode.dstIn,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
