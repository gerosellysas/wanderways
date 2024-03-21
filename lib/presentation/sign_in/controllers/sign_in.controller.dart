import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SignInController extends GetxController with WidgetsBindingObserver {
  final args = Get.arguments;
  final AppService app = Get.find<AppService>();
  final StorageService _storage = Get.find<StorageService>();

  var fieldControllers = <TextEditingController>[];
  var fieldFocuses = <FocusNode>[];
  var _uid = -1;

  var fieldActives = <RxBool>[];
  var fieldEmpties = <RxBool>[];
  var fieldErrors = <RxBool>[];
  var obscure = true.obs;
  var loading = false.obs;

  @override
  void onInit() {
    for (var i = 0; i <= 1; i++) {
      fieldControllers.add(TextEditingController());
      fieldFocuses.add(FocusNode());
      fieldActives.add(false.obs);
      fieldEmpties.add(true.obs);
      fieldErrors.add(false.obs);
    }
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    for (var controller in fieldControllers) {
      controller.dispose();
    }
    for (var focus in fieldFocuses) {
      focus.dispose();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    for (var i = 0; i < fieldFocuses.length; i++) {
      fieldActives[i].value = fieldFocuses[i].hasPrimaryFocus;
    }
    super.didChangeMetrics();
  }

  void onPopped(bool pop) {}

  void onFieldChanged(String str, int index) {
    fieldEmpties[index].value = str.isEmpty;
    fieldErrors[index].value = false;
  }

  Future<void> onFieldSubmitted(int index) async {
    fieldActives[index].value = false;
    if (index == 1) return onSignIn();
    fieldFocuses[index + 1].requestFocus();
    fieldActives[index + 1].value = true;
  }

  void onFieldTapped(int index) {
    var activeIndex = fieldActives.indexWhere((active) => active == true.obs);
    if (activeIndex != -1) fieldActives[activeIndex].value = false;
    fieldFocuses[index].requestFocus();
    fieldActives[index].value = true;
  }

  Future<bool> _validateEmail() async {
    var validFormat = EmailValidator.validate(fieldControllers[0].text);
    if (!validFormat) return validFormat;
    _uid = _storage.listUser.indexWhere(
      (u) => u.email == fieldControllers[0].text,
    );
    return _uid != -1;
  }

  Future<bool> _validatePassword() async {
    if (_uid == -1) return false;
    return fieldControllers[1].text == _storage.listUser[_uid].password;
  }

  void onObscureTapped() {
    obscure.toggle();
  }

  Future<bool> _validateSignIn() async {
    if (fieldErrors[0].value && fieldErrors[1].value) return false;
    if (fieldControllers[0].text.isEmpty || fieldControllers[1].text.isEmpty) {
      for (var i = 0; i < fieldEmpties.length; i++) {
        fieldErrors[i].value = fieldEmpties[i].value;
      }
      return false;
    }
    return true;
  }

  Future<void> onSignIn() async {
    _validateSignIn().then((valid) async {
      if (!valid) return;
      FocusManager.instance.primaryFocus!.unfocus();
      for (var error in fieldErrors) {
        error.value = false;
      }
      loading.value = true;
      var emailValid = await _validateEmail();
      var passwordValid = await _validatePassword();
      Future.delayed(const Duration(seconds: 2), () {
        fieldErrors[0].value = !emailValid;
        fieldErrors[1].value = !passwordValid;
        if (fieldErrors.contains(true.obs)) return loading.value = false;
        var uid = _storage.listUser[_uid].id!;
        _storage
            .fetchSingleUser(uid)
            .then((u) => _storage.user.value = u!)
            .then((u) => _storage.saveLoggedUser(u.email!))
            .then((_) => _onSuccessSignIn());
      });
    });
  }

  Future<void> _onSuccessSignIn() async {
    loading.value = false;
    await Get.offAllNamed("/home", arguments: args);
  }

  Future<void> goToSignUpScreen() async {
    await Get.offNamed("/sign_up", arguments: args);
  }
}
