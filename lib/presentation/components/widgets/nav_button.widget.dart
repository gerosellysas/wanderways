import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class NavButton extends StatelessWidget {
  final double? w;
  final String? text;
  final Color? textColor;
  final Color? color;
  final Color? splashColor;
  final NavButtonStyle? style;
  final void Function()? onTap;

  const NavButton({
    super.key,
    this.w,
    this.text,
    this.textColor,
    this.color,
    this.splashColor,
    this.style = NavButtonStyle.fill,
    this.onTap,
  });

  double get _height => 40.h;

  double get _width => w ?? 304.w;

  double get _radius => 8.w;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(_radius),
          color: style == NavButtonStyle.outline
              ? Colors.transparent
              : color ?? Hues.primary,
          child: InkWell(
            borderRadius: BorderRadius.circular(_radius),
            highlightColor: splashColor ?? Hues.secondary.withOpacity(0.16),
            splashColor: splashColor ?? Hues.secondary.withOpacity(0.16),
            onTap: onTap,
            child: Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius),
                border: style == NavButtonStyle.outline
                    ? Border.all(
                        width: 1.5,
                        color: color ?? Hues.primary,
                      )
                    : null,
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            height: _height,
            width: _width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_radius),
            ),
            child: Text(
              text!,
              style: Fonts.bold(
                color: style == NavButtonStyle.outline
                    ? color
                    : textColor ?? Hues.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
