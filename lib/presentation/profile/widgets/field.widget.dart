import 'package:flutter/material.dart';
import 'package:wander_ways/presentation/components/components.dart';

class ProfileUserEmailField extends StatelessWidget {
  final int? languageSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isActive;
  final bool? isEmpty;
  final bool? isExist;
  final bool? isError;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final void Function()? onTap;

  const ProfileUserEmailField({
    super.key,
    this.languageSelected,
    this.controller,
    this.focusNode,
    this.isActive,
    this.isEmpty,
    this.isExist,
    this.isError,
    this.onChange,
    this.onSubmit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Field(
      controller: controller,
      focusNode: focusNode,
      autoFocus: false,
      isActive: isActive!,
      isError: isError!,
      isEmpty: isEmpty!,
      inputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      labelText: "Email",
      errorText: isEmpty!
          ? languageSelected == 0
              ? "Email tidak boleh kosong"
              : "Email can't be empty"
          : isExist!
              ? languageSelected == 0
                  ? "Email sudah terdaftar"
                  : "Email already registered"
              : languageSelected == 0
                  ? "Email tidak valid"
                  : "Email is invalid",
      onChange: onChange,
      onSubmit: onSubmit,
      onTap: onTap,
    );
  }
}

class ProfileUserPhoneField extends StatelessWidget {
  final int? languageSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isActive;
  final bool? isEmpty;
  final bool? isExist;
  final bool? isError;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final void Function()? onTap;

  const ProfileUserPhoneField({
    super.key,
    this.languageSelected,
    this.controller,
    this.focusNode,
    this.isActive,
    this.isEmpty,
    this.isExist,
    this.isError,
    this.onChange,
    this.onSubmit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Field(
      controller: controller,
      focusNode: focusNode,
      autoFocus: false,
      isActive: isActive!,
      isError: isError!,
      isEmpty: isEmpty!,
      inputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      maxLength: 22,
      labelText: languageSelected == 0 ? "Nomor telepon" : "Phone number",
      errorText: isEmpty!
          ? languageSelected == 0
              ? "Nomor telepon tidak boleh kosong"
              : "Phone number can't be empty"
          : isExist!
              ? languageSelected == 0
                  ? "Nomor telepon sudah terdaftar"
                  : "Phone number already registered"
              : languageSelected == 0
                  ? "Nomor telepon tidak valid"
                  : "Phone number is invalid",
      onChange: onChange,
      onSubmit: onSubmit,
      onTap: onTap,
    );
  }
}
