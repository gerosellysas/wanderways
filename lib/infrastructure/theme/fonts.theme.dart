import 'package:flutter/widgets.dart';

import 'hues.theme.dart';

class Fonts {
  static TextStyle regular({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle medium({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle semiBold({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle bold({Color? color, double? size}) => TextStyle(
        color: color ?? Hues.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w700,
      );

  static TextStyle italic({Color? color, double? size}) => regular(
        color: color ?? Hues.black,
        size: size ?? 14,
      ).copyWith(fontStyle: FontStyle.italic);

  static TextStyle mediumItalic({Color? color, double? size}) => medium(
        color: color ?? Hues.black,
        size: size ?? 14,
      ).copyWith(fontStyle: FontStyle.italic);

  static TextStyle semiBoldItalic({Color? color, double? size}) => semiBold(
        color: color ?? Hues.black,
        size: size ?? 14,
      ).copyWith(fontStyle: FontStyle.italic);

  static TextStyle boldItalic({Color? color, double? size}) => bold(
        color: color ?? Hues.black,
        size: size ?? 14,
      ).copyWith(fontStyle: FontStyle.italic);
}
