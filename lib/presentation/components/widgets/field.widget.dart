import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class Field extends StatelessWidget {
  final double? w;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isActive;
  final bool? isEmpty;
  final bool? isError;
  final bool? autoFocus;
  final bool? obscure;
  final List<TextInputFormatter>? formatters;
  final TextCapitalization? capitalization;
  final TextInputAction? inputAction;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLength;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Widget? suffix;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final void Function()? onTap;

  const Field({
    super.key,
    this.w,
    this.controller,
    this.focusNode,
    this.isActive = false,
    this.isEmpty = true,
    this.isError = false,
    this.autoFocus,
    this.obscure,
    this.formatters,
    this.capitalization,
    this.inputAction,
    this.keyboardType,
    this.textAlign,
    this.maxLength,
    this.labelText,
    this.hintText,
    this.errorText,
    this.suffix,
    this.onChange,
    this.onSubmit,
    this.onTap,
  });

  double get _height => 52.h;

  double get _radius => _height / 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: _height,
              width: w ?? 304.w,
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                autofocus: autoFocus ?? true,
                obscureText: obscure ?? false,
                cursorWidth: 1.75,
                cursorColor: Hues.primary,
                keyboardType: keyboardType,
                magnifierConfiguration: TextMagnifierConfiguration.disabled,
                maxLength: maxLength,
                style: Fonts.regular(),
                textAlign: textAlign ?? TextAlign.start,
                textCapitalization: capitalization ?? TextCapitalization.none,
                textInputAction: inputAction ?? TextInputAction.done,
                inputFormatters: formatters,
                onChanged: onChange,
                onSubmitted: onSubmit,
                onTap: onTap,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: _radius),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(_radius),
                    borderSide: BorderSide(
                      color: isError == true
                          ? Hues.red
                          : isActive == true
                              ? Hues.primary
                              : isEmpty == true
                                  ? Hues.greyDarkest
                                  : Hues.primary,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(_radius),
                    borderSide: BorderSide(
                      color: isError == true
                          ? Hues.red
                          : isActive == true
                              ? Hues.primary
                              : Hues.greyDarkest,
                      width: isActive == true ? 1.5 : 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(_radius),
                    borderSide: BorderSide(
                      color: isError == true ? Hues.red : Hues.primary,
                      width: 1.5,
                    ),
                  ),
                  counter: const SizedBox(),
                  labelText: labelText,
                  labelStyle: Fonts.regular(
                    color: Hues.greyDarkest,
                  ),
                  floatingLabelStyle: Fonts.regular(
                    color: isError == true
                        ? Hues.red
                        : isActive == true
                            ? Hues.primary
                            : isEmpty == true
                                ? Hues.greyDarkest
                                : Hues.primary,
                  ),
                  hintText: hintText,
                  hintStyle: Fonts.regular(
                    color: isActive == true
                        ? Hues.black
                        : isEmpty == true
                            ? Hues.greyDarkest
                            : Hues.black,
                  ),
                  suffixIcon: suffix,
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: suffix,
            // ),
          ],
        ),
        Visibility(
          visible: isError == true,
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              errorText!,
              style: Fonts.italic(color: Hues.red, size: 11),
            ),
          ),
        ),
      ],
    );
  }
}
