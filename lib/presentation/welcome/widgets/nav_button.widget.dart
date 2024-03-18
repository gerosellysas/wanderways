import 'package:flutter/material.dart';
import 'package:wander_ways/infrastructure/sources/enums/enums.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';
import 'package:wander_ways/presentation/components/components.dart';

class WelcomeNavButton extends StatelessWidget {
  final int? selectedLanguage;
  final NavButtonStyle? style;
  final void Function()? onTap;

  const WelcomeNavButton({
    super.key,
    this.selectedLanguage,
    this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavButton(
      text: style == NavButtonStyle.outline
          ? selectedLanguage == 0
              ? "Daftar"
              : "Sign up"
          : selectedLanguage == 0
              ? "Masuk"
              : "Sign in",
      textColor: Hues.primary,
      color: Hues.accent,
      splashColor: style == NavButtonStyle.outline
          ? null
          : Hues.accentLight.withOpacity(0.64),
      style: style,
      onTap: onTap,
    );
  }
}
