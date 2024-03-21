import 'package:flutter/material.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SignUpFirstNameField extends StatelessWidget {
  final int? languageSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isActive;
  final bool? isEmpty;
  final bool? isError;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final void Function()? onTap;

  const SignUpFirstNameField({
    super.key,
    this.languageSelected,
    this.controller,
    this.focusNode,
    this.isActive,
    this.isEmpty,
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
      capitalization: TextCapitalization.words,
      inputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      maxLength: 25,
      // formatters: [
      //   FilteringTextInputFormatter.allow(
      //     RegExp(r'^([a-zA-Z]+\s)*[a-zA-Z]*'),
      //   ),
      // ],
      labelText: languageSelected == 0 ? "Nama depan" : "First name",
      errorText: isEmpty!
          ? languageSelected == 0
              ? "Nama depan tidak boleh kosong"
              : "First name can't be empty"
          : languageSelected == 0
              ? "Nama hanya boleh berisi alfabet dan spasi antar kata"
              : "Name can only contain alphabet and space between word",
      onChange: onChange,
      onSubmit: onSubmit,
      onTap: onTap,
    );
  }
}

class SignUpLastNameField extends StatelessWidget {
  final int? languageSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isActive;
  final bool? isEmpty;
  final bool? isError;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final void Function()? onTap;

  const SignUpLastNameField({
    super.key,
    this.languageSelected,
    this.controller,
    this.focusNode,
    this.isActive,
    this.isEmpty,
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
      capitalization: TextCapitalization.words,
      inputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      maxLength: 25,
      // formatters: [
      //   FilteringTextInputFormatter.allow(
      //     RegExp(r'^([a-zA-Z]+\s)*[a-zA-Z]*'),
      //   ),
      // ],
      labelText: languageSelected == 0 ? "Nama belakang" : "Last name",
      errorText: isEmpty!
          ? languageSelected == 0
              ? "Nama belakang tidak boleh kosong"
              : "Last name can't be empty"
          : languageSelected == 0
              ? "Nama hanya boleh berisi alfabet dan spasi antar kata"
              : "Name can only contain alphabet and space between word",
      onChange: onChange,
      onSubmit: onSubmit,
      onTap: onTap,
    );
  }
}

class SignUpEmailField extends StatelessWidget {
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

  const SignUpEmailField({
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

class SignUpPhoneField extends StatelessWidget {
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

  const SignUpPhoneField({
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

class SignUpPasswordField extends StatelessWidget {
  final int? languageSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isActive;
  final bool? isEmpty;
  final bool? isLess;
  final bool? isWeak;
  final bool? isError;
  final bool? obscure;
  final void Function()? onObscureTap;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final void Function()? onTap;

  const SignUpPasswordField({
    super.key,
    this.languageSelected,
    this.controller,
    this.focusNode,
    this.isActive,
    this.isEmpty,
    this.isLess,
    this.isWeak,
    this.isError,
    this.obscure,
    this.onObscureTap,
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
      obscure: obscure,
      inputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      labelText: languageSelected == 0 ? "Kata sandi" : "Password",
      errorText: isEmpty!
          ? languageSelected == 0
              ? "Kata sandi tidak boleh kosong"
              : "Password can't be empty"
          : isLess!
              ? languageSelected == 0
                  ? "Panjang kata sandi minimal harus 8 karakter"
                  : "Password length must be at least 8 characters"
              : isWeak!
                  ? languageSelected == 0
                      ? "Kata sandi harus terdapat setidaknya satu huruf besar, satu huruf kecil, satu angka, dan satu karakter khusus"
                      : "Password must contain at least one uppercase, one lowercase, one number and one special character"
                  : languageSelected == 0
                      ? "Kata sandi tidak valid"
                      : "Password is invalid",
      suffix: IconPressButton(
        icon: obscure! ? Images.eyeShow : Images.eyeHide,
        onTap: onObscureTap,
      ),
      onChange: onChange,
      onSubmit: onSubmit,
      onTap: onTap,
    );
  }
}

class SignUpConfirmPassField extends StatelessWidget {
  final int? languageSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isActive;
  final bool? isEmpty;
  final bool? isError;
  final bool? obscure;
  final void Function()? onObscureTap;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final void Function()? onTap;

  const SignUpConfirmPassField({
    super.key,
    this.languageSelected,
    this.controller,
    this.focusNode,
    this.isActive,
    this.isEmpty,
    this.isError,
    this.obscure,
    this.onObscureTap,
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
      obscure: obscure,
      inputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 20,
      labelText:
          languageSelected == 0 ? "Konfirmasi kata sandi" : "Confirm password",
      errorText: isEmpty!
          ? languageSelected == 0
              ? "Konfirmasi kata sandi tidak boleh kosong"
              : "Confirm password can't be empty"
          : languageSelected == 0
              ? "Konfirmasi kata sandi tidak sesuai dengan kata sandi sebelumnya"
              : "Confirm password doesn't match previous password",
      suffix: IconPressButton(
        icon: obscure! ? Images.eyeShow : Images.eyeHide,
        onTap: onObscureTap,
      ),
      onChange: onChange,
      onSubmit: onSubmit,
      onTap: onTap,
    );
  }
}
