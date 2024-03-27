import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:wander_ways/infrastructure/sources/constants/constants.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class ProfileSettings extends StatelessWidget {
  final int? languageSelected;
  final void Function(int)? onTap;
  final void Function(bool)? onLanguageChanged;

  const ProfileSettings({
    super.key,
    this.languageSelected,
    this.onTap,
    this.onLanguageChanged,
  });

  List<String> get _icons => [
        Images.security,
        Images.passenger,
        Images.about,
        Images.term,
        Images.help,
        Images.translate,
        Images.logout,
      ];

  List<String> get _settingsID => [
        "Keamanan",
        "Detail penumpang",
        "Tentang kami",
        "Syarat & ketentuan",
        "Pusat bantuan",
        "Bahasa",
        "Keluar",
      ];

  List<String> get _settingsEN => [
        "Security",
        "Passenger details",
        "About us",
        "Terms & conditions",
        "Help center",
        "Language",
        "Sign out"
      ];

  List<Widget> get _settings => List.generate(
        _icons.length,
        (index) => _ProfileSettingsCard(
          key: key,
          languageSelected: languageSelected,
          icon: _icons[index],
          settingsID: _settingsID[index],
          settingsEN: _settingsEN[index],
          onTap: index == 5 ? null : () => onTap!(index),
          child: index == 5
              ? _ProfileSettingsSwitchButton(
                  key: key,
                  languageSelected: languageSelected,
                  onLanguageChanged: onLanguageChanged,
                )
              : null,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: _settings,
      ),
    );
  }
}

class _ProfileSettingsCard extends StatelessWidget {
  final int? languageSelected;
  final String? icon;
  final String? settingsID;
  final String? settingsEN;
  final Widget? child;
  final void Function()? onTap;

  const _ProfileSettingsCard({
    super.key,
    this.languageSelected,
    this.icon,
    this.settingsID,
    this.settingsEN,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Hues.secondary.withOpacity(0.16),
        splashColor: Hues.secondary.withOpacity(0.16),
        onTap: onTap,
        child: Container(
          height: 52.h,
          decoration: BoxDecoration(
            border: Border(
              top: const BorderSide(color: Hues.greyDark),
              bottom: icon == Images.logout
                  ? const BorderSide(color: Hues.greyDark)
                  : BorderSide.none,
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 12.w),
              Container(
                height: 24.w,
                width: 24.w,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  icon!,
                  height: 24.w,
                  width: 24.w,
                  fit: BoxFit.contain,
                  colorFilter: const ColorFilter.mode(
                    Hues.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                languageSelected == 0 ? settingsID! : settingsEN!,
                style: Fonts.semiBold(),
              ),
              const Expanded(child: SizedBox()),
              child ??
                  Transform.flip(
                    flipX: true,
                    child: Container(
                      height: 24.w,
                      width: 24.w,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        Images.arrow,
                        height: 24.w,
                        width: 24.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
              SizedBox(width: 12.w),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileSettingsSwitchButton extends StatelessWidget {
  final int? languageSelected;
  final void Function(bool)? onLanguageChanged;

  const _ProfileSettingsSwitchButton({
    super.key,
    this.languageSelected,
    this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      color: Colors.transparent,
      child: FlutterSwitch(
        showOnOff: true,
        valueFontSize: 8,
        activeText: "ID",
        activeTextColor: Hues.white,
        activeTextFontWeight: FontWeight.w600,
        inactiveText: "EN",
        inactiveTextColor: Hues.white,
        inactiveTextFontWeight: FontWeight.w600,
        height: 18.h,
        width: 40.w,
        padding: 2.w,
        toggleSize: 16.w,
        activeColor: Hues.primary,
        inactiveColor: Hues.primary,
        toggleColor: Hues.white,
        switchBorder: Border.all(
          width: 0.5,
          color: Hues.secondary,
        ),
        value: languageSelected == 0,
        onToggle: onLanguageChanged!,
      ),
    );
  }
}
