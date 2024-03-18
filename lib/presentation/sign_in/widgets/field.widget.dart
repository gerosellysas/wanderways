import 'package:flutter/material.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SignInEmailField extends StatelessWidget {
  final int? languageSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isEmpty;
  final bool? isError;
  final void Function(String)? onChange;

  const SignInEmailField({
    super.key,
    this.languageSelected,
    this.controller,
    this.focusNode,
    this.isEmpty,
    this.isError,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Field(
      controller: controller,
      focusNode: focusNode,
      autoFocus: false,
      isError: isError!,
      inputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      labelText: "Email",
      errorText: isEmpty!
          ? languageSelected == 0
              ? "Email tidak boleh kosong"
              : "Email can't be empty"
          : languageSelected == 0
              ? "Email tidak valid"
              : "Email is invalid",
      onChange: onChange,
    );
  }
}

class SignInPasswordField extends StatelessWidget {
  final int? languageSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isEmpty;
  final bool? isError;
  final bool? obscure;
  final void Function()? onObscureTap;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;

  const SignInPasswordField({
    super.key,
    this.languageSelected,
    this.controller,
    this.focusNode,
    this.isEmpty,
    this.isError,
    this.obscure,
    this.onObscureTap,
    this.onChange,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Field(
      controller: controller,
      focusNode: focusNode,
      autoFocus: false,
      isError: isError!,
      obscure: obscure,
      maxLength: 6,
      inputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      labelText: languageSelected == 0 ? "Kata sandi" : "Password",
      errorText: isEmpty!
          ? languageSelected == 0
              ? "Kata sandi tidak boleh kosong"
              : "Password can't be empty"
          : languageSelected == 0
              ? "Kata sandi tidak valid"
              : "Password is invalid",
      suffix: IconPressButton(
        icon: obscure! ? Images.eyeShow : Images.eyeHide,
        onTap: onObscureTap,
      ),
      onChange: onChange,
      onSubmit: onSubmit,
    );
  }
}
